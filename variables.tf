variable "function_name" {
  type    = string
  default = "Test"
}
variable "description" {
  type    = string
  default = "Create Export task for VPC flow logs to S3 bucket"
}
variable "handler" {
  type    = string
  default = ""
}
variable "runtime" {
  type    = string
  default = "python3.9"
}

variable "timeout" {
  type    = number
  default = 900
}

variable "publish" {
  type    = bool
  default = true
}
variable "create_package" {
  type    = bool
  default = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "create_role" {
  description = "Controls whether IAM role for Lambda Function should be created"
  type        = bool
  default     = true
}
variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}
variable "attach_policy_statements" {
  description = "Controls whether policy_statements should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}
variable "policy_statements" {
  description = "Map of dynamic policy statements to attach to Lambda Function role"
  type        = any
  default     = {}
}
