variable "vpc" {
  description = "VPC map with an ID element"
  type        = map(any)
  default = {
    id = "none"
  }
}
