# Reusable expressions 
locals {
  app_name = "hush-off"
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1" # Ireland
}

module "hushOffResourceManager" {
  source = "./modules/resourceManager"
  # Params
  application = local.app_name
  environment = var.env
  # Outputs
}

module "hushOffClassifier" {
  source = "./modules/classifier"
  # Params
  application = local.app_name
  environment = var.env
  # Outputs
}

module "hushOffPipeline" {
  source = "./modules/pipeline"
  # Params
  application = local.app_name
  environment = var.env
  # Outputs
}

module "hushOffFrontend" {
  source = "./modules/frontend"
  # Params
  application = local.app_name
  environment = var.env
  # Outputs
}
