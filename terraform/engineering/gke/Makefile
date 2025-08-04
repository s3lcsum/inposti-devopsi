#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

# Override for engineering - no environment/region specific vars
VARS_FILE := $(GIT_ROOT)/terraform/engineering/gke/terraform.tfvars
TF_WORKSPACE := engineering

.PHONY: cluster-info kubectl

# Override check for engineering (no env/region validation needed)
check:
	@test -f $(VARS_FILE) || (echo "$(RED)❌ Missing $(VARS_FILE) file$(NC)"; exit 1)
	@echo "$(GREEN)✅ Engineering GKE configuration$(NC)"

cluster-info: check get ## Get cluster information
	$(call HEADER,"Getting cluster information")
	@terraform output

kubectl: check get ## Configure kubectl
	$(call HEADER,"Configuring kubectl")
	@gcloud container clusters get-credentials \
		$$(terraform output -raw cluster_name) \
		--region $$(terraform output -raw cluster_location)
