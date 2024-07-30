resource "alicloud_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "this" {
  security_group_id = alicloud_security_group.this.id
  type              = var.rule_type
  ip_protocol       = var.protocol
  nic_type          = var.nic_type
  policy            = var.policy
  port_range        = var.port_range
  priority          = var.priority
  cidr_ip           = var.cidr_ip
  description       = var.description
}
