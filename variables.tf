variable "additional_policy_json" {
  description = "The JSON for the policy document to be attached to the lambdas IAM role."
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the lambda function."
  type        = string
}

variable "environment_variables" {
  description = "Map of environment variables for the lambda function."
  type        = map(string)
  default     = {}
}

variable "lambda_runtime" {
  description = "The runtime for the lambda function."
  type        = string
  default     = "nodejs16.x"
}

variable "name" {
  description = "The lambda name."
  type        = string
}

variable "region" {
  description = "The AWS region."
  type        = string
  default     = "eu-west-2"
}
