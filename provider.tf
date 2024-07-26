terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.227.0"
    }
  }
}

provider "alicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
