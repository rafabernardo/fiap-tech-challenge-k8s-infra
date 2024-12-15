resource "aws_security_group" "sg" {
  name   = var.securityGroupeName
  vpc_id = data.aws_vpc.vpc.id
}
#   ingress {
#     description = "All"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "VPC"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["172.31.0.0/16"]
#   }

#   egress {
#     description = "All"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "rds_sg" {
#   name   = "${var.projectName}-rds-sg"
#   vpc_id = data.aws_vpc.vpc.id

#   ingress {
#     description     = "Allow Postgres traffic from EKS nodes"
#     from_port       = 5432
#     to_port         = 5432
#     protocol        = "tcp"
#     security_groups = [data.terraform_remote_state.rds.outputs.security_group_id]
#   }

#   egress {
#     description = "Allow all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_security_group_rule" "sg_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id

}

resource "aws_security_group_rule" "sg_ingress_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = aws_security_group.sg.id

}


resource "aws_security_group_rule" "sg_egrss" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id

}

# resource "aws_security_group_rule" "sg_ingress_rds" {
#   type                     = "ingress"
#   from_port                = 5432
#   to_port                  = 5432
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.sg.id
#   source_security_group_id = aws_security_group.sg.id
# }


