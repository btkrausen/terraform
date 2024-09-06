variable "prd_vpc_cidr_block" {
  description = "The CIDR block for the production VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}(\\/\\d{1,2})?$", var.prd_vpc_cidr_block))
    error_message = "Invalid CIDR block format. Please provide a valid IP address or CIDR block."
  }
}

variable "prd_vpc_enable_dns_hostnames" {
  description = "Enable DNS hostnames for the production VPC"
  type        = bool
  default     = true
}

variable "dev_cidr_block" {
  description = "The CIDR block for the development VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dev_vpc_name" {
  description = "The name of the development VPC"
  type        = string
}
