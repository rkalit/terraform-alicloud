variable "zone" {
  type = list(object({
    id = string
  }))
  default = [
    {
      id = "ap-southeast-5a"
    },
    {
      id = "ap-southeast-5b"
    },
    {
      id = "ap-southeast-5c"
    }
  ]
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vswitch_cidrs" {
  type    = list(string)
  default = []
}

variable "vswitch_name" {
  type    = list(string)
  default = []
}

variable "rtb_name" {
  type    = string
  default = ""
}

variable "eip_name" {
  type = string
}

variable "eip_bandwidth" {
  type = number
}

variable "eip_payment_type" {
  type = string
}

variable "create_eip" {
  type = bool
}

variable "create_nat_gateway" {
  type = bool
}
