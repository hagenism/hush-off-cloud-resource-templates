variable "env" {
  type    = string
  default = "dev"
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
    application = "hush-off"
    environment = var.env
  }
}
