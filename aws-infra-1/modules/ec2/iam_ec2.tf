resource "aws_iam_role" "ec2_role" {
  name = "ec2_minimal_role"

  assume_role_policy = jsonencode({
    Version = "2025-05-31",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "ec2_attach" {
  name       = "attach_readonly"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
