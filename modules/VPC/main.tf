resource "aws_vpc" "web_Application_VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.tags, { Name = "${var.project_name}-vpc" })
  
}



# Fetch availability zones
data "aws_availability_zones" "web_zone" {
  state = "available"
}

resource "aws_subnet" "web_Application_Subnet" {
  count                   = length(data.aws_availability_zones.web_zone.names)
  vpc_id                  = aws_vpc.web_Application_VPC.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = data.aws_availability_zones.web_zone.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "public-${count.index}" })
}

# Create an Internet Gateway
resource "aws_internet_gateway" "webapp_gateway" {
  vpc_id = aws_vpc.web_Application_VPC.id
  tags   = merge(var.tags, { Name = "${var.project_name}-igw" })
}

# Create a public route table
resource "aws_route_table" "webapp_public_rt" {
  vpc_id = aws_vpc.web_Application_VPC.id
  tags   = merge(var.tags, { Name = "${var.project_name}-public-rt" })
}

# Add default route to IGW
resource "aws_route" "default_internet_access" {
  route_table_id         = aws_route_table.webapp_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webapp_gateway.id
}

# Associate public subnets with route table
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.web_Application_Subnet)
  subnet_id      = aws_subnet.web_Application_Subnet[count.index].id
  route_table_id = aws_route_table.webapp_public_rt.id
}

