provider "aws" {
  alias  = "root"
  region = local.default_region
}

locals {
  default_region = "us-east-1"

  account_info_org_iam = {
    name  = "hygieia-org-iam"
    email = "kiessling.manuel+hygieia-aws-org-iam@gmail.com"
  }

  account_info_infra_homepage_prod = {
    name  = "hygieia-infra-homepage-prod"
    email = "kiessling.manuel+hygieia-aws-infra-homepage-prod@gmail.com"
  }

  account_info_infra_webapp_prod = {
    name  = "hygieia-infra-webapp-prod"
    email = "kiessling.manuel+hygieia-aws-infra-webapp-prod@gmail.com"
  }

  account_info_infra_webapp_preprod = {
    name  = "hygieia-infra-webapp-preprod"
    email = "kiessling.manuel+hygieia-aws-infra-webapp-preprod@gmail.com"
  }
}
