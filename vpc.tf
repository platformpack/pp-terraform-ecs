locals {
  use_existing_vpc = try(regex("^vpc-.*$", var.vpc.id), false) != false ? true : false

  resource_name = join("-", [local.organization_name, local.environment_name, "vpc"])

  #ToDo: Calculate the CIDR and Subnets
  cidr = "10.99.0.0/18"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets  = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]

}

module "vpc" {
  count   = local.use_existing_vpc ? 0 : 1
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.resource_name
  cidr = local.cidr

  azs             = local.azs
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets

  enable_nat_gateway      = true
  single_nat_gateway      = true
  enable_dns_hostnames    = true
  map_public_ip_on_launch = false

  tags = local.tags
}
