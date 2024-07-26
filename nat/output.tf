output "nat_gateway_id" {
  value = var.create_nat_gateway ? alicloud_nat_gateway.this[0].id : ""
}