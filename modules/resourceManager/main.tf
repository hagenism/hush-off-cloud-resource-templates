resource "aws_appsync_graphql_api" "resource_mgr_gql_api" {
  authentication_type = "AMAZON_COGNITO_USER_POOLS"
  name                = "ResourceManagerApi"

  user_pool_config {
    aws_region     = var.region
    default_action = "DENY"
    user_pool_id   = "${aws_cognito_user_pool.example.id}"
  }

  schema = file("$./schema.graphql")

  tags = {
    application = var.application
    environment = var.environment
  }
}
