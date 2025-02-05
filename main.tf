# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "bsns-lab"

    workspaces {
      name = "hcp-bslab01-ws-01"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_s3_bucket" {
  bucket = "my-test-bucket-bsns-001"
  acl    = "private"

  tags = {
    Name        = "my-test-bucket-bsns-002"
    Environment = "Dev"
  }
}
