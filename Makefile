.PHONY: import_organization cleanup plan apply

cleanup:
	rm -f terraform.tfstate

plan:
	terraform plan

apply:
	terraform apply

import_organization:
	terraform import module.account_onboarding.module.organization.aws_organizations_organization.this $(shell aws organizations describe-organization --query 'Organization.Id' --output text)

install_precommits:
	pre-commit install
	pre-commit install-hooks