# Reusable expressions 
locals {
  app_name = var.app_name
  env      = var.env
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-west-1" # Ireland
}

resource "aws_kinesis_stream" "general_comment_data_stream" {
  name                = "comment-data-stream"
  shard_count         = 1
  retention_period    = 24
  encryption_type     = "NONE"
  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
  tags = {
    application = local.app_name
    environment = lcoal.env
  }
}
