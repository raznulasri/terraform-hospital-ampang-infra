# 1. AMPANG VPC PLAN
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.39.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "ampang-vpc"
  }
}

# 2. INTERNET GATEWAY (For FortiGate to the Internet)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "ampang-IGW"
  }
}

# 3. SUBNETS BASED ON IP PLAN

# Public Subnet (FortiGate WAN)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.39.10.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-Firewall"
  }
}

# Private Subnet - Infra (10.39.101.0/24)
resource "aws_subnet" "infra_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.39.101.0/24"

  tags = {
    Name = "Private-Infra"
  }
}

# Private Subnet - Storage SAN (10.39.102.0/24)
resource "aws_subnet" "storage_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.39.102.0/24"

  tags = {
    Name = "Private-Storage"
  }
}

# Private Subnet - DB Oracle (10.39.103.0/24)
resource "aws_subnet" "db_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.39.103.0/24"

  tags = {
    Name = "Private-DB"
  }
}

# Private Subnet - Dept 1 (10.39.111.0/24)
resource "aws_subnet" "dept1_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.39.111.0/24"

  tags = {
    Name = "Private-Dept1"
  }
}

# Private Subnet - Dept 2 (10.39.123.0/24)
resource "aws_subnet" "dept2_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.39.123.0/24"

  tags = {
    Name = "Private-Dept2"
  }
}

# 4. ROUTE TABLES

# Route Table Public (Direct Internet access via IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Private (All Outbound Traffic MUST Pass Through the FortiGate Network Interface)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  # Note: After FortiGate VM/ENI create, point route 0.0.0.0/0 to ENI FortiGate
  # route {
  #   cidr_block           = "0.0.0.0/0"
  #   network_interface_id = aws_network_interface.fortigate_private_eni.id
  # }

  tags = {
    Name = "Private-Route-Table-Via-FortiGate"
  }
}

# Associate All Private Subnets with the Private Route Table
resource "aws_route_table_association" "infra_assoc" {
  subnet_id      = aws_subnet.infra_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "db_assoc" {
  subnet_id      = aws_subnet.db_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "dept1_assoc" {
  subnet_id      = aws_subnet.dept1_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "dept2_assoc" {
  subnet_id      = aws_subnet.dept2_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "storage_assoc" {
  subnet_id      = aws_subnet.storage_subnet.id
  route_table_id = aws_route_table.private_rt.id
}