# Here is an example of a Terraform configuration that can be used to create a CI/CD pipeline
# for deploying Docker containers to Amazon Web Services (AWS) Elastic Container Service for Kubernetes (EKS):

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an EKS cluster
resource "aws_eks_cluster" "cluster" {
  name     = "my-cluster"
  role_arn = "${aws_iam_role.cluster.arn}"
}

# Create an IAM role for the EKS cluster
resource "aws_iam_role" "cluster" {
  name = "my-cluster-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Create an IAM policy for the EKS cluster
resource "aws_iam_policy" "cluster" {
  name = "my-cluster-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "eks:*",
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Attach the IAM policy to the EKS cluster role
resource "aws_iam_role_policy_attachment" "cluster" {
  role       = "${aws_iam_role.cluster.name}"
  policy_arn = "${aws_iam_policy.cluster.arn}"
}

# Create an IAM role for the CI/CD pipeline
resource "aws_iam_role" "pipeline" {
  name = "my-pipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Create an IAM policy for the CI/CD pipeline
resource "aws_iam_policy" "pipeline" {
  name = "my-pipeline-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  " Statement": [
    {
      "Action": "codepipeline:*",
      "Resource": "*",
      "Effect": "Allow"
    },
    {
      "Action": "eks:*",
      "Resource": "*",
      "Effect": "Allow"
    },
    {
      "Action": "s3:*",
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
EOF
