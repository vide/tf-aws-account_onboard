# DevOps Exercise: AWS Account Onboarding with Terraform

## **Objective**

Create an AWS account onboarding process using Terraform. The process should automate the
creation of an AWS organization, organizational units, Route 53 resources, and new AWS
accounts. The goal is to create reusable Terraform modules to simplify onboarding multiple
AWS accounts.

## **Timeline:**

Candidates will have 1 week to complete this challenge and then to deliver your results to the
Hiring Lead (gerard@aparentmedia.com).

**Due Date:** Monday, November 18th

## **Requirements**

1. **OrganizationModule:**
    * Create an AWS organization named `my-aws-org`.
    * Create an organizational unit (OU) named `my-ou` within `my-aws-org`.
    * Create an `admin` permission set, an identity storegroup, and assign the
       permission set to the group.
2. **Route 53 Module:**
    * Create all necessary resources to support a single domain/zone.
    * Allow setting a list of DNS records to be created within the domain/zone.
3. **AccountModule:**
    * Create an AWS organization account within the `my-ou` OU using the `parent_id`
       from the organization module.
    * Instantiate the Route 53 module to create DNS records for the new account.

## **Guidelines**

Your Terraform code should be modular and reusable, allowing the onboarding of multiple AWS
accounts by passing:

* `account_name`, used for account name setup.
* `domain` to beusedforthisaccount,thiswillregisteraroute53zoneusingthisdomain..
* `dns_records` list of DNS records that needs to be included along the account creation
process for the givend omain.

Ensure that any AWS credentials are configured properly and are shared and stored in a safe
way.

## **Delivery instructions**

Include clear instructions on how to test the Terraform exercise after we download your code.
This should cover initializing, bootstrapping AWS credentials and how to apply the Terraform
configuration to provision the resources.

Push your project to a GitHub repository. If a private repo is needed, share your GitHub
username, and a private repo will be created for you.

## **Evaluation Criteria**

* Correctness and completeness of the Terraform configuration to accomplish the
requested requirements.
* Code modularity and reusability.
* Futureproof, delivered code can be extended to support complex requirements.
* Adhere to any good practices that you think are important to follow.
* Documentation and clarity of instructions.

**Goodluck! We look forward to reviewing your solution!**