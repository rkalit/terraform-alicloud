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

resource "alicloud_snat_entry" "this" {
  count         = var.create_nat_gateway && var.eip_address_id != "" ? 1 : 0
  snat_table_id = alicloud_nat_gateway.this.snat_table_ids
  snat_ip       = var.eip_address
}
