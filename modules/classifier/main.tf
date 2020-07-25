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
    application = var.application
    environment = var.environment
  }
}
