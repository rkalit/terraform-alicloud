data "alicloud_images" "images_id" {
  most_recent = true
  name_regex  = var.image_name_regex
}

resource "alicloud_instance" "this" {
  instance_name        = var.instance_name
  host_name            = var.hostname
  image_id             = data.alicloud_images.images_id.images[0].id
  instance_type        = var.instance_type
  vswitch_id           = var.vswitch_id
  private_ip           = var.private_ip
  security_groups      = [var.security_groups]
  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size
  password             = var.password

  dynamic "data_disks" {
    for_each = var.data_disk_size > 0 ? [1] : []

    content {
      size                 = var.data_disk_size
      category             = var.data_disk_category
      delete_with_instance = var.data_disk_delete_with_instance
    }
  }
}
