provider "aws" {
    region = "us-west-2"
}

resource "aws_iam_user" "transferfamily" {
    name = "user"
}

    resource "aws_iam_policy" "transferfamily" {
        name ="familytransfer"

        policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "transfer:TestIdentityProvider",
                "transfer:CreateUser",
                "transfer:DescribeExecution",
                "transfer:TagResource",
                "transfer:ListServers",
                "transfer:ListWorkflows",
                "transfer:ImportSshPublicKey",
                "transfer:DescribeAccess",
                "transfer:UntagResource",
                "transfer:UpdateUser",
                "transfer:DescribeServer",
                "transfer:DescribeUser",
                "transfer:CreateWorkflow",
                "transfer:ListExecutions",
                "transfer:DescribeWorkflow",
                "transfer:DescribeSecurityPolicy",
                "transfer:ListUsers",
                "transfer:ListSecurityPolicies",
                "transfer:ListAccesses",
                "transfer:ListTagsForResource"
            ],
            "Resource": "*",
            "Condition": {
                "BoolIfExists": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        }
    ]
}
        EOF
    }


resource "aws_iam_policy_attachment" "policybind" {
  name = "attachment"
  users = [aws_iam_user.transferfamily.name]
  policy_arn = aws_iam_policy.transferfamily.arn
}