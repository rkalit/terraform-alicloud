resource "alicloud_instance" "this" {
  instance_name        = var.instance_name
  host_name            = var.hostname
  image_id             = var.image_id
  instance_type        = var.instance_type
  vswitch_id           = var.vswitch_id
  private_ip           = var.private_ip
  security_groups      = var.security_groups
  system_disk_name     = var.system_disk_name
  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size
  data_disks {
    name     = var.data_disk_name
    size     = var.data_disk_size
    category = var.data_disk_category
  }
}
