locals {
  default_region = "us-east-1"

  account_info_org_iam = {
    id    = "197752213991"
    name  = "hygieia-org-iam"
  }

  account_info_infra_homepage_prod = {
    id    = "806143112085"
    name  = "hygieia-infra-homepage-prod"
  }

  account_info_infra_webapp_preprod = {
    id    = "039307614955"
    name  = "hygieia-infra-webapp-preprod"
  }

  account_info_infra_webapp_prod = {
    id    = "199387562978"
    name  = "hygieia-infra-webapp-prod"
  }

  account_manager_group_name = "AccountManagers"
  account_manager_role_name = "AccountManager"
}


provider "aws" {
  region     = local.default_region
}

provider "aws" {
  region     = local.default_region
  alias      = "org_iam"
}

provider "aws" {
  alias = "infra_webapp_prod"
  assume_role {
    role_arn = "arn:aws:iam::${local.account_info_infra_webapp_prod.id}:role/${local.account_manager_role_name}"
  }
  region = local.default_region
}

provider "aws" {
  alias = "infra_webapp_preprod"
  assume_role {
    role_arn = "arn:aws:iam::${local.account_info_infra_webapp_preprod.id}:role/${local.account_manager_role_name}"
  }
  region = local.default_region
}

provider "aws" {
  alias = "infra_homepage_prod"
  assume_role {
    role_arn = "arn:aws:iam::${local.account_info_infra_homepage_prod.id}:role/${local.account_manager_role_name}"
  }
  region = local.default_region
}


data "aws_iam_policy" "read_only_access" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  provider = aws.org_iam
}
