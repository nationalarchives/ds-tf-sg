variable "name" {}
variable "description" {}
variable "vpc_id" {}

variable "ingress" {
    type = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = []
    }))
}
variable "egress" {
    type = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = []
    }))
}

variable "tags" {
    type = list(object({
        name    = string
        content = string
    }))
}
