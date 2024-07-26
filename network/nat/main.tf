# NAT Gateway
resource "alicloud_nat_gateway" "this" {
  count = var.create_nat_gateway ? 1 : 0

  nat_gateway_name = var.nat_gateway_name
  vpc_id           = var.vpc_id
  vswitch_id       = var.vswitch_id
  nat_type         = var.nat_type
  payment_type     = var.payment_type
}

resource "alicloud_eip_association" "this" {
  count         = var.create_nat_gateway && var.eip_address_id != "" ? 1 : 0
  instance_id   = alicloud_nat_gateway.this[0].id
  allocation_id = var.eip_address_id
}

resource "alicloud_route_entry" "this" {
  count = var.nat_gateway_name ? 1 : 0
  route_table_id = var.route_table_id
  destination_cidrblock = "0.0.0.0/0"
  nexthop_id = alicloud_nat_gateway.this[0].id
  nexthop_type = "NatGateway"
}

resource "alicloud_snat_entry" "this" {
  count             = var.create_nat_gateway ? length(var.snat_entries) : 0
  snat_table_id     = alicloud_nat_gateway.this[0].snat_table_ids
  snat_ip           = var.snat_entries[count.index].snat_ip
  source_vswitch_id = var.snat_entries[count.index].vswitch_id
}
