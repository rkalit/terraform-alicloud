variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "region" {
  type    = string
  default = "ap-southeast-5"
}

variable "vpc_name" {
  description = "variable for the name of the VPC"
  type = string
}

variable "vpc_cidr" {
  description = "variable for the CIDR block of the VPC"
  type = string
}

variable "vswitch_cidrs" {
  description = "variable for the CIDR of the vswitch"
  type = list(string)
}

variable "vswitch_name" {
  description = "variable for the vswitches name"
  type = list(string)
}

variable "eip_name" {
  description = "variable for the Elastic IP name"
  type = string
}

variable "eip_bandwidth" {
  description = "variable for bandwidth of the EIP"
  type = number
  default = 10
}

variable "eip_payment_type" {
  description = "variable for EIP payment type (Prepaid or Postpaid)"
  type = string
  default = "PayAsYouGo"
}

variable "rtb_name" {
  description = "variable route table name"
  type = string
}

variable "create_eip" {
  type = bool
}

variable "create_nat_gateway" {
  type = bool
}