resource "alicloud_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "ingress" {
  count             = length(var.ingress_rules)
  security_group_id = alicloud_security_group.this.id
  type              = "ingress"
  ip_protocol       = var.ingress_rules[count.index].protocol
  policy            = var.ingress_rules[count.index].policy
  port_range        = var.ingress_rules[count.index].port_range
  cidr_ip           = var.ingress_rules[count.index].cidr_ip
}

resource "alicloud_security_group_rule" "egress" {
  count             = length(var.egress_rules)
  security_group_id = alicloud_security_group.this.id
  type              = "egress"
  ip_protocol       = var.egress_rules[count.index].protocol
  policy            = var.egress_rules[count.index].policy
  port_range        = var.egress_rules[count.index].port_range
  cidr_ip           = var.egress_rules[count.index].cidr_ip
}
