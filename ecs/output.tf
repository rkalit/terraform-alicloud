output "instance_id" {
  value = alicloud_instance.this.id
}

output "hostname" {
  value = alicloud_instance.this.host_name
}