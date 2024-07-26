variable "create_nat_gateway" {
  description = "whether to create the NAT Gateway"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC Id which the NAT Gateway will be attached"
  type        = string
}

variable "vswitch_id" {
  description = "VSwitch Id which the NAT Gateway will be attached"
  type        = string
}

variable "eip_address_id" {
  description = "The Id of EIP to associate with the NAT Gateway"
  type        = string
  default     = ""
}

variable "eip_address" {
  description = "The Id of EIP to associate with the NAT Gateway"
  type        = string
  default     = ""
}

variable "nat_gateway_name" {
  description = "The name of the NAT Gateway"
  type        = string
  default     = ""
}

variable "nat_type" {
  description = "The type of the NAT Gateway"
  type        = string
  default     = "Enhanced"
}

variable "payment_type" {
  description = "Payment Type of the NAT Gateway (PrePaid or PostPaid)"
  type        = string
  default     = "PayAsYouGo"
}

variable "eip_name" {
  description = "Name of the EIP"
  type        = string
  default     = ""
}

variable "eip_bandwidth" {
  description = "The bandwidth of the EIP for the NAT GateWay"
}
