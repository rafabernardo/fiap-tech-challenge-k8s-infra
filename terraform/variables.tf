variable "regionDefault" {
  default = "us-east-1"
}

variable "eksName" {
  default = "eks-fiap-tech"
}

variable "nodeGroupName" {
  default = "eks-fiap-tech-node"
}

variable "nodeInstanceType" {
  default = "t3a.medium"
}

variable "labRole" {
  default = "arn:aws:iam::194982485425:role/LabRole"
}

variable "projectName" {
  default = "fiap-tech-challenge"
}

variable "securityGroupeName" {
  default = "eks-sg"
}

variable "vpcId" {
  default = "vpc-04420e52d5db86655"
}

variable "instanceType" {
  default = "t3a.medium"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "principalArn" {
  default = "arn:aws:iam::194982485425:role/voclabs"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}
