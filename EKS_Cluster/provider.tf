provider "aws" {
  region = "eu-west-3"
}
provider "kubernetes" {
  config_path    = "/var/lib/jenkins/.kube/config"
  config_context = "arn:aws:eks:eu-west-3:211125306909:cluster/my-eks-cluster"
}
