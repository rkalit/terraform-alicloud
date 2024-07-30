module "vpc" {
  source        = "./vpc"
  vpc_cidr      = var.vpc_cidr
  vpc_name      = var.vpc_name
  vswitch_cidrs = var.vswitch_cidrs
  vswitch_name  = var.vswitch_name
  rtb_name      = var.rtb_name
}

module "eip" {
  source        = "./eip"
  create_eip    = var.create_eip
  eip_name      = var.eip_name
  eip_bandwidth = var.eip_bandwidth
  payment_type  = var.eip_payment_type
}

module "nat_gateway" {
  source             = "./nat"
  create_nat_gateway = var.create_nat_gateway
  vpc_id             = module.vpc.this_vpc_id
  vswitch_id         = module.vpc.vswitch_ids[0]
  route_table_id     = module.vpc.route_table_id
  eip_address_id     = module.eip.eip_address_id
  snat_entries = [
    {
      snat_ip    = module.eip.eip_address
      vswitch_id = module.vpc.vswitch_ids[0]
    }
  ]
}

module "sec_group" {
  source  = "./sec_group"
  vpc_id  = module.vpc.this_vpc_id
  sg_name = var.sg_name

  for_each   = var.security_group_rules
  rule_type  = each.value.type
  protocol   = each.value.protocol
  policy     = each.value.policy
  port_range = each.value.port_range
  priority   = each.value.priority
  cidr_ip    = each.value.cidr_ip
}


