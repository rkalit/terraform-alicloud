variable "sg_name" {
  description = "variable for security group name"
  type        = string
}

variable "vpc_id" {
  description = "variable for vpc which security to be attached"
  type        = string
}

variable "ingress_rules" {
  description = "List of the ingress rules to apply on the security group rules"
  type = list(object({
    protocol   = string
    port_range = string
    policy     = string
    cidr_ip    = string
  }))
  default = []
}

variable "egress_rules" {
  description = "List of the egress rules to apply on the security group rules"
  type = list(object({
    protocol   = string
    port_range = string
    policy     = string
    cidr_ip    = string
  }))
  default = []
}
