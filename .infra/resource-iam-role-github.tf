resource "aws_iam_role" "github_oidc_role" {
  name = "github-actions-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::372376449465:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : "repo:GertValiakhmetov/rsschool-devops-course-tasks:ref:refs/heads/task-*"
          }
        }
      }
    ]
  })
}