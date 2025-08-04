#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

.PHONY: bucket-info list

bucket-info: check get ## Get bucket information
	$(call HEADER,"Getting bucket information")
	@terraform output

list: ## List all buckets
	$(call HEADER,"Listing all buckets")
	@gsutil ls
