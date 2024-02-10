variable "vpc_cidr" {
  description = "This is cidr of vpc "
  type        = string
}
variable "private_subnets" {
  description = "private Subnets cidr"
}
variable "public_subnets" {
  description = "public Subnets cidr"
}
