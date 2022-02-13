terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

variable "user_name" {
  type = string
}

variable "groups" {
  type = list(string)
}

variable "iam_account_id" {
  type = string
}

resource "aws_iam_user" "default" {
  name = var.user_name
}

resource "aws_iam_user_group_membership" "default" {
  groups = var.groups
  user = aws_iam_user.default.name
}

resource "aws_iam_user_policy" "default" {
  policy = templatefile(
    "./modules/create-user/templates/user_policy.tpl",
    {
      user_name = aws_iam_user.default.name
      account_id = var.iam_account_id
    }
  )
  user = aws_iam_user.default.name
}
