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
  type        = string
}

variable "vpc_cidr" {
  description = "variable for the CIDR block of the VPC"
  type        = string
}

variable "vswitch_cidrs" {
  description = "variable for the CIDR of the vswitch"
  type        = list(string)
}

variable "vswitch_name" {
  description = "variable for the vswitches name"
  type        = list(string)
}

variable "eip_name" {
  description = "variable for the Elastic IP name"
  type        = string
}

variable "eip_bandwidth" {
  description = "variable for bandwidth of the EIP"
  type        = number
  default     = 10
}

variable "eip_payment_type" {
  description = "variable for EIP payment type (Prepaid or Postpaid)"
  type        = string
  default     = "PayAsYouGo"
}

variable "rtb_name" {
  description = "variable route table name"
  type        = string
}

variable "create_eip" {
  type = bool
}

variable "create_nat_gateway" {
  type = bool
}

variable "sg_name" {
  type = string
}

variable "ecsdata" {
  description = "variable for needed for creating the ECS instance"
  type        = map(string)
}

variable "ingress_rules" {
  description = "List of the ingress rules to apply on the security group rules"
  type = list(object({
    protocol   = string
    policy     = string
    port_range = string
    cidr_ip    = string
  }))
}

variable "instances" {
  description = "List of ECS instances to be created"
  type = map(object({
    name = string
    hostname = string
    image_name_regex = string
    instance_type = string
    system_disk_size = number
    password = string
    data_disk_size = number
  }))
}