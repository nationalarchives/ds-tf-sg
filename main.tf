resource "aws_security_group" "security_group" {
    name        = var.name
    description = var.description
    vpc_id      = var.vpc_id

    dynamic ingress {
        for_each = var.ingress
        content {
            description = each.value.description
            from_port   = each.value.from_port
            to_port     = each.value.to_port
            protocol    = each.value.protocol
            cidr_blocks = each.value.cidr_blocks
        }
    }

    dynamic egress {
        for_each = var.egress
        content {
            description = each.value.description
            from_port   = each.value.from_port
            to_port     = each.value.to_port
            protocol    = each.value.protocol
            cidr_blocks = each.value.cidr_blocks
        }
    }
}
