
# create an iam user
resource "aws_iam_user" "iam_user" {
  name = var.user_name
}

# attache policy to iam user created
resource "aws_iam_policy_attachment" "iam_user_policy" {
    name        = var.attachment_name
    users       = [aws_iam_user.iam_user.name]
    policy_arn  = var.attach_policy_arn
}