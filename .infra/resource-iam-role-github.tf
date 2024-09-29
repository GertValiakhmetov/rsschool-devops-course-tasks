resource "aws_iam_role" "github_oidc_role" {
  name = "github-actions-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : aws_iam_openid_connect_provider.github.arn
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : "repo:GertValiakhmetov/rsschool-devops-course-tasks:ref:refs/heads/*"
          }
        }
      }
    ]
  })
}