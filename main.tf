module "lambda_function" {
  source                   = "terraform-aws-modules/lambda/aws"
  version                  = "v4.8.0"
  function_name            = var.function_name
  description              = var.description
  handler                  = var.handler
  runtime                  = var.runtime
  publish                  = var.publish
  create_package           = var.create_package
  local_existing_package   = "./export-logs-s3.zip"
  timeout                  = var.timeout
  tags                     = var.tags
  attach_policy_statements = var.attach_policy_statements
  policy_statements        = var.policy_statements
  environment_variables    = var.environment_variables
}

