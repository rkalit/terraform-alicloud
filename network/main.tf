resource "alicloud_vpc" "this" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "this" {
  count        = length(var.vswitch_cidrs)
  zone_id      = var.zone[count.index].id
  vswitch_name = var.vswitch_name[count.index]
  cidr_block   = var.vswitch_cidrs[count.index]
  vpc_id       = alicloud_vpc.this.id
}

# Route Table
resource "alicloud_route_table" "this" {
  vpc_id           = alicloud_vpc.this.id
  route_table_name = var.rtb_name
}

resource "alicloud_route_table_attachment" "this" {
  count          = length(var.vswitch_cidrs)
  vswitch_id     = alicloud_vswitch.this[count.index].id
  route_table_id = alicloud_route_table.this.id
}

# NAT Gateway
resource "alicloud_nat_gateway" "this" {
  vpc_id           = var.nat.vpc_id
  vswitch_id       = var.nat.vswitch_id
  nat_gateway_name = var.nat.name
  nat_type         = var.nat.type
  payment_type     = var.nat.payment_type
}

resource "alicloud_eip_address" "this" {
  description  = var.name
  isp          = "BGP"
  address_name = var.name
  netmode      = "public"
  bandwidth    = var.bandwidth
  payment_type = var.payment_type
}