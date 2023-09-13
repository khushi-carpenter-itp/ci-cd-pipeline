output "lambda_arn" {
  value = module.lambda_function.lambda_function_arn
}
output "lambda_target_id" {
  value = module.lambda_function.lambda_function_url_id
}

output "lambda_function_name" {
  value = module.lambda_function.lambda_function_name
}