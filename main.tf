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

  ingress_rules = var.ingress_rules
}


module "ecs" {
  source = "./ecs"

  for_each         = var.instances
  instance_name    = each.value.name
  hostname         = each.value.hostname
  image_name_regex = each.value.image_name_regex
  instance_type    = each.value.instance_type
  system_disk_size = each.value.system_disk_size
  security_groups  = module.sec_group.security_group_id
  vswitch_id       = module.vpc.vswitch_ids[0]
  password         = each.value.password
  data_disk_size   = each.value.data_disk_size
}
