#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

.PHONY: cluster-info kubectl

cluster-info: check get ## Get cluster information
	$(call HEADER,"Getting cluster information")
	@terraform output

kubectl: check get ## Configure kubectl
	$(call HEADER,"Configuring kubectl")
	@gcloud container clusters get-credentials \
		$$(terraform output -raw cluster_name) \
		--region $$(terraform output -raw cluster_location)
