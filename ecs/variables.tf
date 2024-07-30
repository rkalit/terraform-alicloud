variable "instance_name" {
  description = "The variable for isntance name"
  type        = string
}

variable "hostname" {
  description = "variable for instance's hostname"
  type        = string
}

variable "image_id" {
  description = "variable for image id for the instance"
  type        = string
}

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
  type        = list(string)
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
}

variable "data_disk_size" {
  description = "variable for data disk size"
  type        = number
}

variable "data_disk_category" {
  description = "variable for data disk category"
  type        = string
  default     = "cloud_ssd"
}
