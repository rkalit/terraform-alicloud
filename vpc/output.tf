output "this_vpc_id" {
  value = alicloud_vpc.this.id
}

output "vswitch_ids" {
  value = alicloud_vswitch.this.*.id
}

output "route_table_id" {
  value = alicloud_route_table.this.id
}
# output "nat_gateway_id" {
#   value = module.nat_gateway.id
# }