resource "aws_iam_role" "lambda" {
  name               = "${var.name}-lambda"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "additional" {
  name        = "${var.name}-lambda"
  description = "Additionally attached policy for ${var.name} lambda."
  policy      = var.additional_policy_json
}

resource "aws_iam_role_policy_attachment" "additional" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.additional.arn
}

resource "aws_lambda_function" "this" {
  function_name    = var.name
  description      = var.description
  filename         = "${path.module}/init.zip"
  role             = aws_iam_role.lambda.arn
  handler          = "lambda.handler"
  runtime          = var.lambda_runtime

  environment {
    variables = var.environment_variables
  }
}
