terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  alias = "platformpack"
}

module "example-stack" {
  source = "../../"

  new_stack_name = "example-stack"

  providers = {
    spacelift = spacelift.platformpack
  }
}
