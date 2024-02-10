variable "vpc_cidr" {
  description = "This is cidr of vpc "
  type        = string
}
variable "public_subnets" {
  description = "private Subnets cidr"
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}
variable "private_subnets" {
  description = "public Subnets cidr"
  default = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
}
