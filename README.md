# Alibaba Cloud Terraform
---
This Repository consist of terraform code to provision several Alibaba Cloud Resource using terraform

## Usage
---
```
terraform init
terraform plan
terraform apply
```

### Explanation
---
This repository is consist only several resource creation on Alibaba Cloud using terraform for the time being. Mainly, to add or remove resource, just focus on the main.tf on the root folder and also add terraform.tfvars file on the root folder for all the value of the variable needed.

`terraform.tfvars` example are below:
```
access_key = "<your-access-key>"
secret_key = "<your-secret-key>"

vpc_name = "TF-baseline-VPC"
vpc_cidr = "172.16.0.0/12"

vswitch_cidrs = [ "172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24" ]
vswitch_name = [ "TF-vswitch-a", "TF-vswitch-b", "TF-vswitch-c" ]

eip_name = "EIP-NAT-TF"
eip_bandwidth = 10
eip_payment_type = "PayAsYouGo"

rtb_name = "tf-baseline-route-table"
create_nat_gateway = true
create_eip = true

sg_name = "TF-Security-Group"
ingress_rules = [
  {
    protocol = "tcp"
    policy = "accept"
    port_range = "22/22"
    cidr_ip = "192.168.1.0/24"
  }
]

instances = {
  "instance-01" = {
    name = "TF-instance-baseline"
    hostname = "TF-baseline"
    image_name_regex = "^win2019.*en-us.*"
    instance_type = "ecs.c6.large"
    system_disk_size = 60
    password = "<your-instance-password>"
    data_disk_size = 100
  }
  "instance-02" = {
    name = "TF-instance-02"
    hostname = "TF-instance-02"
    image_name_regex = "^win2019.*en-us.*"
    instance_type = "ecs.c6.large"
    system_disk_size = 60
    password = "your-instance-password"
    data_disk_size = 100
  }
} 
```
Above is the example of the value of the variable used in the main.tf. For the `access_key` and `secret_key` part, you can use os environment variable instead of putting it in the tfvars file.

From the `terraform.tfvars` on the `instance` block, we use `instance_name_regex` so we can separate if we want to create several instances with different OS at once.

*note : You can add more type of resource by adding your own module, or you can always just use the alicloud official module from the terraform registry.*