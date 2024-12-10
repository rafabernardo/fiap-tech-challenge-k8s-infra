variable "regionDefault" {
  default = "us-east-1"
}

variable "eksName" {
  default = "eks-fiap-tech"
}

variable "eksVersion" {
  default = "1.29"
}

variable "serviceIpv4" {
  default = "10.100.0.0/16"
}

variable "nodeGroupName" {
  default = "eks-fiap-tech-node"
}

variable "nodeDiskSize" {
  default = 20
}

variable "nodeInstanceType" {
  default = "c3.xlarge"
}

variable "nodeCapacityType" {
  default = "ON_DEMAND"
}

variable "nodeAmiType" {
  default = "AL2_x86_64"
}

variable "ebsAddonName" {
  default = "aws-ebs-csi-driver"
}

variable "ebsAddonVersion" {
  default = "v1.28.0-eksbuild.1"
}
