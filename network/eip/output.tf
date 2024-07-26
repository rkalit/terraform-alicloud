output "eip_address_id" {
  value = var.create_eip ? alicloud_eip_address.this[0].id : ""
}

output "eip_address" {
  value = var.create_eip ? alicloud_eip_address.this[0].ip_address : ""
}