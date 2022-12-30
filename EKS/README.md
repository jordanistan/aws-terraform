Here is a step-by-step guide to writing a Terraform configuration that creates an Amazon Web Services (AWS) Elastic Container Service for Kubernetes (EKS) cluster using modules:

Install Terraform on your local machine by following the instructions on the Terraform website (https://www.terraform.io/downloads.html).

Set up an AWS account and configure your local machine to use your AWS credentials by following the instructions in the AWS documentation (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).

Create a new directory for your Terraform project, and open a new file called main.tf in this directory. This file will contain the main Terraform configuration for your EKS cluster.

Add the following code to your main.tf file to specify the AWS provider and the version of Terraform you are using:

## 

```terraform 
provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 0.13"
}

```

## Add the following code to your main.tf file to create an IAM role that will be used by the EKS cluster:

```terraform 
resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-cluster-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

```

## Create a new directory called modules in your project directory, and within it create a new directory called eks. Inside the eks directory, create a new file called main.tf. This file will contain the code for a Terraform module that creates an EKS cluster.

```terraform 

```

## In the eks/main.tf file, add the following code to specify the input variables for the module:

```terraform 
variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster to create."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which to create the EKS cluster."
}

variable "subnet_ids" {
  type        = list(string)
  description = "The IDs of the subnets in which to create the EKS cluster."
}

variable "role_arn" {
  type        = string
  description = "The ARN of the IAM role to use for the EKS cluster."
}

```

## Add the following code to the eks/main.tf file to create the EKS cluster using the input variables:

```terraform 
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  vpc_config {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }
  role_arn

```

