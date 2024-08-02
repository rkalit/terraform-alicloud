variable "instance_name" {
  description = "The variable for isntance name"
  type        = string
}

variable "hostname" {
  description = "variable for instance's hostname"
  type        = string
}

# variable "image_id" {
#   description = "variable for image id for the instance"
#   type        = string
# }

variable "instance_type" {
  description = "variable for instance type"
  type        = string
}

variable "vswitch_id" {
  description = "variable for vswitch id for the instance"
  type        = string
}

variable "private_ip" {
  description = "variable for defining the private ip for the instance if needed"
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "variable for security group id for the instances"
  type        = string
}

variable "system_disk_name" {
  description = "variable for system_disk name"
  type        = string
  default     = ""
}

variable "system_disk_category" {
  description = "variable for system disk category"
  type        = string
  default     = "cloud_ssd"
}

variable "system_disk_size" {
  description = "variable for system disk size"
  type        = number
}

variable "data_disk_name" {
  description = "variable for data disk name"
  type        = string
  default     = ""
}

variable "data_disk_size" {
  description = "variable for data disk size"
  type        = number
  default     = 0
}

variable "data_disk_category" {
  description = "variable for data disk category"
  type        = string
  default     = "cloud_ssd"
}

variable "password" {
  description = "the password for the instances"
  type        = string
}

variable "data_disk_delete_with_instance" {
  description = "whether the data disk will be released after the instance release"
  type        = bool
  default     = true
}

variable "image_name_regex" {
  description = "The name regex for the image id to be used as the image of the instance"
  type        = string
}
