variable "name" {}
variable "description" {}
variable "vpc_id" {}

variable "ingress" {}
variable "egress" {}

variable "tags" {
    type = list(object({
        name    = string
        content = string
    }))
}
