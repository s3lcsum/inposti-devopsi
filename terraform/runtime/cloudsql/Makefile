#!/usr/bin/env make -f

include $(shell git rev-parse --show-toplevel)/terraform/modules/makefiles/terraform.mk

.PHONY: db-info proxy

db-info: check get ## Get database information
	$(call HEADER,"Getting database information")
	@terraform output

proxy: check get ## Start CloudSQL proxy
	$(call HEADER,"Starting CloudSQL proxy")
	@cloud_sql_proxy -instances=$$(terraform output -raw connection_name)=tcp:5432
