variable "PROFILE" {
    default = "abhi-blog"
}

variable "AMIS" {
    type = "map"
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

variable "INSTANCE_USER" {
    default = "ubuntu"
}