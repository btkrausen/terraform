variable "dev_cidr_block" {
  description = "The CIDR block for the development VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dev_vpc_name" {
  description = "The name of the development VPC"
  type        = string
}
