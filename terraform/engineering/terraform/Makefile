#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

# Override for engineering - no environment/region specific vars
VARS_FILE := $(GIT_ROOT)/terraform/engineering/terraform/terraform.tfvars
TF_WORKSPACE := engineering

# Override check for engineering (no env/region validation needed)
check:
	@test -f $(VARS_FILE) || (echo "$(RED)❌ Missing $(VARS_FILE) file$(NC)"; exit 1)
	@echo "$(GREEN)✅ Engineering terraform configuration$(NC)"
