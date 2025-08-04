#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

# Override for networking - no environment/region specific vars
VARS_FILE := $(GIT_ROOT)/terraform/networking/terraform.tfvars
TF_WORKSPACE := networking

# Override check for networking (no env/region validation needed)
check:
	@test -f $(VARS_FILE) || (echo "$(RED)❌ Missing $(VARS_FILE) file$(NC)"; exit 1)
	@echo "$(GREEN)✅ Networking configuration$(NC)"
