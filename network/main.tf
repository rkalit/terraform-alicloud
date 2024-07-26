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

module "eip" {
  source = "./eip"
  create_eip = var.create_eip
  eip_name = var.eip_name
  eip_bandwidth = var.eip_bandwidth
  payment_type = var.eip_payment_type
}

module "nat_gateway" {
  source = "./nat"
  create_nat_gateway = var.create_nat_gateway
  vpc_id = alicloud_vpc.this.id
  vswitch_id = alicloud_vswitch.this.id
  route_table_id = alicloud_route_table.this.id
  eip_address_id = module.eip.eip_address_id
  snat_entries = [
    {
        snat_ip = module.eip.eip_address
        vswitch_id = alicloud_vswitch.this.*.id
    }
  ]
}

