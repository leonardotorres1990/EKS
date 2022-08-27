variable "region" {
  description = "The region are building into."
  type        = string
}

variable "eks_cidr_block" {
  description = "CIDR block for eks vpc"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "subnet_1" {
  type    = string
  default = "First Subnet"
}

variable "subnet_2" {
  type    = string
  default = "Second Subnet"
}

variable "pub_subnet_2" {
  type    = string
  default = "Second Public Subnet"
}

variable "pub_subnet_1" {
  type    = string
  default = "First Public Subnet"
}