variable "sg_name" {
  description = "variable for security group name"
  type        = string
}

variable "vpc_id" {
  description = "variable for vpc which security to be attached"
  type        = string
}

variable "rule_type" {
  description = "variable for rule_type on security group rule"
  type        = string
  default     = "ingress"
}

variable "protocol" {
  description = "variable for ip protocol on security group rule"
  type        = string
  default     = "tcp"
}

variable "nic_type" {
  description = "variable for nic type on security group rule (should set to intranet when security group type is vpc)"
  type        = string
  default     = "intranet"
}

variable "policy" {
  description = "policy for security group, either to accept or to deny request"
  type        = string
}

variable "port_range" {
  description = "variable for port range for security group"
  type        = string
}

variable "priority" {
  description = "variable for priority on the security group rule"
  type        = number
  default     = 1
}

variable "cidr_ip" {
  description = "variable for the ip where the request come from"
  type        = string
  default     = "0.0.0.0/0"
}

variable "description" {
  description = "variable for security group roles' description"
  type = string
  default = ""
}