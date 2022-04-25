//VPC Varialbes
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR for VPC"
}

variable "enable_dns_support" {
    default = true
}

variable "enable_dns_hostnames" {
    default = true
}

variable "vpc_name" {
  type        = string
  default     = "main"
  description = ""
}

variable "private1_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Private Subnet 1 CIDR"
}

variable "private2_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Private Subnet 2 CIDR"
}

variable "public_cidr" {
  type        = string
  default     = "10.0.3.0/24"
  description = "Public Subnet CIDR"
}

variable "private1_az" {
  type        = string
  default     = "us-east-1a"
  description = "AZ1"
}

variable "private2_az" {
  type        = string
  default     = "us-east-1b"
  description = "AZ2"
}

variable "public_az" {
  type        = string
  default     = "us-east-1c"
  description = "AZ3"
}
