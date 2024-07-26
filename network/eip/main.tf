resource "alicloud_eip_address" "this" {
  count = var.create_eip ? 1 : 0

  description          = var.eip_name
  isp                  = "BGP"
  address_name         = var.eip_name
  netmode              = "public"
  bandwidth            = var.eip_bandwidth
  payment_type         = var.payment_type
  internet_charge_type = var.internet_charge_type
}
