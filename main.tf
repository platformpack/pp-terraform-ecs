locals {
  region                = "us-east-1"
  organization_name     = "pp"
  environment_name      = "preview"
  default_resource_name = join("-", [local.organization_name, local.environment_name, "ecs"])
  tags = {
    Name       = local.default_resource_name
    Repository = "https://github.com/platformpack/pp-terraform-ecs"
  }
}
