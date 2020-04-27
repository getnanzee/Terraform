provider "aws" {
  profile = "${var.PROFILE}"
  region = "${var.REGION}"
}

variable "PROFILE" {
    default = "abhi-blog"
}

variable "INSTANCE_TYPE" {
  default = "t2.medium"
}

variable "AMIS" {
    type = map(string)
    default = {
        us-west-1 = "ami-0dd655843c87b6930"
    }
}
variable "REGION" {
    default = "us-west-1"
}

variable "PUBLIC_KEY" {
    default = "elastic.pub"
}

variable "PRIVATE_KEY" {
    default = "elastic"
}

variable "NODES" {
    type = list(string)
    default = ["master", "node1", "node2"]
}