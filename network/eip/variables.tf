variable "create_eip" {
  description = "wether to create an EIP"
  type        = bool
  default     = false
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

variable "internet_charge_type" {
  description = "The charge type of the EIP"
  type        = string
  default     = "PayByTraffic"
}
