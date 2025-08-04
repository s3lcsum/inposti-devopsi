#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

.PHONY: roles policies

roles: check get ## List IAM roles
	$(call HEADER,"Listing IAM roles")
	@terraform state list | grep google_project_iam

policies: check get ## Show IAM policies
	$(call HEADER,"Showing IAM policies")
	@terraform output
