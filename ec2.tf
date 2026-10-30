# linux base
data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# windows base
data "aws_ami" "windows_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}



data "aws_iam_instance_profile" "my_ssm_profile" {
  name = "EC2-SSM-Role"
}

# < bersambung
resource "aws_instance" "my_server_firewall" {
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name

  tags = {
    Name = "firewall via ubuntu"
  }
}

resource "aws_instance" "my_server_monitoring" {
  ami                    = data.aws_ami.my_ami.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.infra_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name

  # Set your fixed private IP here
  private_ip             = "10.39.101.13"

  tags = {
    Name = "AMP-IFMO01"
  }
}


# windoww
resource "aws_instance" "my_server_dc1" {
  ami                    = data.aws_ami.windows_ami.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.infra_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.my_ssm_profile.name

  # Set your fixed private IP here cant use 101.1
  # AWS strictly prohibits assigning 10.39.101.1 to any EC2 instance. 
  # At the AWS hypervisor level, Amazon automatically hardcodes and owns .1
  private_ip             = "10.39.101.10"

  tags = {
    Name = "AMP-IFDC01"
  }
}


# foriget