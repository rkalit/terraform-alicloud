data "alicloud_images" "ubuntu" {
  most_recent = true
  name_regex = "^ubuntu_20.*64"
}

data "alicloud_images" "centos" {
  most_recent = true
  name_regex = "^centos_7.*64"
}