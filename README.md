# Vide's DevOps exercise

This is my implementation of what requested for the exercise. You can find the initial statement in [REQUIREMENTS.md](REQUIREMENTS.md)

WORK IN PROGRESS. I will add more instructions here, at the moment it works like some kind of diary/personal notes.

---


1. Register a new AWS standalone account. For this you will need:
   1. an email address for the root user
   2. a valid telephone number to complete the CAPTCHA
   3. a valid credit/debit card :money_with_wings:
2. In the AWS web console, create a "legacy" user and its access keys. Add this user to a group with admin permissions and generate an AWS access key for that user. If in your account you already have IAM configured or accounts/keys created, you can skip this step.
   1. Run `aws configure` or create the relevant `.aws/` files with your default region of choice, your AWS Account ID and its secret key.
   2. 🤦🏻 ClickOps! 🤦🏻 In the web console, enable the AWS IAM Identity Center feature. This can be only done manually even according to [AWS IAM <> Terraform integration code](https://github.com/aws-ia/terraform-aws-permission-sets?tab=readme-ov-file#prerequisites).
   3. [CHECKME] At this point, we could probably create the first user with programmatic access here instead of point 1, following AWS best practices. We would use then `aws sso` to login.
   4. :warning: **Do not enable** the AWS Organizations from the UI
   5. [CHECKME] If you created the AWS Organizations in the UI, you will need to `terraform import` it.

### Lessons learned (or remembered... again)

* AWS Accounts can be a bad beast with Terraform because there are important things behind private API (i.e. payment method) and because well, they are a very sensitive piece of AWS (imagine destroying an account by accident), so they might need some extra manual steps, especially if you are playing-doing PoC with them. And also [mandatory wait times](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_troubleshoot.html#troubleshoot_general_error-wait-req) before being able to actually perform the action.