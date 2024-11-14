# Decisions and tradeoffs

I want to try to explain a bit the decision process, the issues and doubts arisen during the implementation of the exercise statement. In the real world, this would probably be a wiki page, a long comment or series of comments in a ticket, or a meeting/pairing with who made the request initially and the persons who are going to implement it.

## TF Statefile

Since this is a "simple" exercise, it uses by default a local statefile (which is gitignored). Obviously this is NOT OPTIMAL for a real world usage (i.e. everything above a single user running it from their machine). I could probably implement it anyway, but being something so standard and widely understood and used, I don't think it would prove anything special about my knowledge. I hope I'm not wrong 😅

## The `my-aws-org` naming

For the life of me, I cannot find a way to setup a name on the Organizations root, and I don't think there is any. I tried with a `Name` tag attached on it but it doesn't show up in any special/meaningful place (unlike, say, EC2 instances case). If you referred to the root account name, then you have to choose that name before doing anything with Terraform, so the module can't do it either.
If I'm missing it or misunderstood the requirement and there is an obvious way, well, I'm sorry. I will learn something new with this experience, at least.

## IAM Identity Center (& Organizations) ClickOps

This is something I didn't touch in ages and actually went through several iterations of the product, but again everything points that the initial setup must be done through the web UI because it uses some internal API not exposed in the SDK/public.
This forces us to import the resource in Terraform...

## Imports

I was eager to try the "new" `import{}` block of TF 1.5+, since in my previous company we already have 100% IaC coverage but in the end, the workflow in this specific case would have not changed too much anyway, so I preferred to have a good old one-time import, simplified by a Makefile.

## DNS & accounts

The statement is a bit vague/unclear in my opinion, and reading it twice I thought it was asking to create the zone and entries **in the children accounts**, and I was a bit scared that I screwed up my implementation, which creates them in the root account. Reading it once again it says

> Instantiate the Route 53 module to create DNS records **for** the new account

Emphasis on the "for", which adds vaguety to the statement IMO. If this what you asked, again, in the real world this would have sparked a discussions before implementing. I hope it's not a deal-breaker.

FYI I didn't implement it with multi-account because it would make the terraform process much more complicated, since the accounts are dynamically created and then it's complicated (impossible?) to use them in a provider in the same TF pass.

# Alternative implementations?

After writing all the code for the org+accounts management myself, I found out there is an existing TF module which seems quite similar to part of the task asked here: https://github.com/getindata/terraform-aws-organization/
So, another possible approach would be relying on this module instead of the homegrown `organization` and `account` modules. The Route53 part should be implemented anyway but it could be done either with what
we have now or with some other 3rd party module.

# Lessons learned (or remembered... again)

AWS Accounts can be a bad beast with Terraform because there are important things behind private API (i.e. payment method) and because well, they are a very sensitive piece of AWS (imagine destroying an account by accident), so they might need some extra manual steps, especially if you are playing-doing PoC with them. And also [mandatory wait times](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_troubleshoot.html#troubleshoot_general_error-wait-req) before being able to actually perform the action.