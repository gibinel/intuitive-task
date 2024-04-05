resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.lambda_function_name}_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_policy" "lambda_s3_access" {
  name = "${var.lambda_function_name}_s3_access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:PutObject"],
        Resource = "arn:aws:s3:::${var.bucket_name}/*",
        Effect   = "Allow"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_s3_access.arn
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = var.runtime
  s3_bucket     = var.bucket_name
  s3_key        = var.lambda_zip_path

  tags = local.required_tags

  depends_on = [aws_iam_role_policy_attachment.lambda_s3_access_attachment]
}
