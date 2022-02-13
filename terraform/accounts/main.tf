provider "aws" {
  alias      = "root"
  region     = local.default_region
}


variable "account_credentials_org_iam" {
  type = object({ access_key_id = string, secret_access_key = string })
}

provider "aws" {
  alias      = "org_iam"
  access_key = var.account_credentials_org_iam.access_key_id
  secret_key = var.account_credentials_org_iam.secret_access_key
  region     = local.default_region
}


variable "account_credentials_infra_webapp_preprod" {
  type = object({ access_key_id = string, secret_access_key = string })
}

provider "aws" {
  alias      = "infra_webapp_preprod"
  access_key = var.account_credentials_infra_webapp_preprod.access_key_id
  secret_key = var.account_credentials_infra_webapp_preprod.secret_access_key
  region     = local.default_region
}


variable "account_credentials_infra_webapp_prod" {
  type = object({ access_key_id = string, secret_access_key = string })
}

provider "aws" {
  alias      = "infra_webapp_prod"
  access_key = var.account_credentials_infra_webapp_prod.access_key_id
  secret_key = var.account_credentials_infra_webapp_prod.secret_access_key
  region     = local.default_region
}


variable "account_credentials_infra_homepage_prod" {
  type = object({ access_key_id = string, secret_access_key = string })
}

provider "aws" {
  alias      = "infra_homepage_prod"
  access_key = var.account_credentials_infra_homepage_prod.access_key_id
  secret_key = var.account_credentials_infra_homepage_prod.secret_access_key
  region     = local.default_region
}


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

  account_manager_user_name = "AccountManager"
  account_manager_group_name = "AccountManagers"
  account_manager_role_name = "AccountManager"
  account_management_policy_name = "AccountManagement"
  account_management_policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOT
}
