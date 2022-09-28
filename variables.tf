variable "vpc" {
  description = "VPC map to provide ID and Name"
  type        = map(any)
  default = {
    id = "none"
  }
}
