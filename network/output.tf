output "this_vpc_id" {
  value = alicloud_vpc.this.id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}