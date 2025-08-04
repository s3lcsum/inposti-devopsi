#!/usr/bin/env make -f

# Common Terraform Makefile
# Include this in terraform configurations: include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

GIT_ROOT := $(shell git rev-parse --show-toplevel)
REL_DIR := $(shell pwd | sed 's|$(GIT_ROOT)/||')

# Default values for moving around terminal fast and bold
# ENVIRONMENT ?=
# REGION ?=

# Dynamic variables
TF_WORKSPACE := $(ENVIRONMENT)-$(REGION)
VARS_FILE := $(GIT_ROOT)/terraform/variables/$(ENVIRONMENT)/$(REGION).tfvars

# Colors and formatting
CYAN = \033[36m
GREEN = \033[32m
RED = \033[31m
YELLOW = \033[33m
NC = \033[0m

define HEADER
	@echo "$(CYAN)================================================$(NC)"
	@echo "$(CYAN) $(1)$(NC)"
	@echo "$(CYAN)================================================$(NC)"
endef

.PHONY: help check get plan apply destroy validate fmt clean workspace

help: ## Show available targets
	@echo
	@echo 'Usage: make <command> ENVIRONMENT=<env> REGION=<region>'
	@echo
	@echo 'Example: make plan ENVIRONMENT=prd REGION=us-central1'
	@echo
	@echo 'ENVIRONMENT: Environment name (dev, prd, env)'
	@echo 'REGION     : Region name (us-central1, us-west1, etc.)'
	@echo
	@echo 'Available Commands:'
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z_-]+:.*?## / {printf "  $(CYAN)%-15s$(NC) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo

check: ## Validate environment and region parameters
	@$(if $(ENVIRONMENT),,echo "$(RED)❌ ENVIRONMENT not set$(NC)"; exit 1)
	@$(if $(REGION),,echo "$(RED)❌ REGION not set$(NC)"; exit 1)
	@test -f $(VARS_FILE) || (echo "$(RED)❌ Missing $(VARS_FILE) file$(NC)"; exit 1)
	@echo "$(GREEN)✅ Environment: $(ENVIRONMENT), Region: $(REGION)$(NC)"

init: ## Initialize terraform
	$(call HEADER,"Initializing Terraform")
	@terraform init

get: check init ## Get or create workspace
	$(call HEADER,"Setting up workspace $(TF_WORKSPACE)")
	@terraform workspace select $(TF_WORKSPACE) 2>/dev/null || terraform workspace new $(TF_WORKSPACE)

plan: check get ## Create execution plan
	$(call HEADER,"Planning for $(TF_WORKSPACE)")
	@terraform plan -var-file="$(VARS_FILE)"

apply: check get ## Apply changes
	$(call HEADER,"Applying changes for $(TF_WORKSPACE)")
	@terraform apply -var-file="$(VARS_FILE)"

destroy: check get ## Destroy resources
	$(call HEADER,"Destroying resources for $(TF_WORKSPACE)")
	@terraform destroy -var-file="$(VARS_FILE)"

validate: ## Validate configuration
	@terraform validate

fmt: ## Format files
	@terraform fmt -recursive

vars: ## Show current variables
	@echo "$(GREEN)Configuration:$(NC)"
	@echo "  Environment: $(YELLOW)$(ENVIRONMENT)$(NC)"
	@echo "  Region: $(YELLOW)$(REGION)$(NC)"
	@echo "  Workspace: $(YELLOW)$(TF_WORKSPACE)$(NC)"
	@echo "  Variables file: $(YELLOW)$(VARS_FILE)$(NC)"
	@echo "  Directory: $(YELLOW)$(REL_DIR)$(NC)"
