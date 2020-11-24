# ------------------------------------------------------------------------------
# general security group module
# ------------------------------------------------------------------------------
resource "aws_security_group" "security_group" {
    name        = var.name
    description = var.description
    vpc_id      = var.vpc_id

    dynamic ingress {
        for_each = var.ingress
        content {
            description     = ingress.value.description
            from_port       = ingress.value.from_port
            to_port         = ingress.value.to_port
            protocol        = ingress.value.protocol
            cidr_blocks     = try(ingress.value.cidr_blocks, null)
            security_groups = try(ingress.value.security_groups, null)
            self            = try(ingress.value.self, false)
        }
    }

    dynamic egress {
        for_each = var.egress
        content {
            description     = egress.value.description
            from_port       = egress.value.from_port
            to_port         = egress.value.to_port
            protocol        = egress.value.protocol
            cidr_blocks     = try(egress.value.cidr_blocks, null)
            security_groups = try(egress.value.security_groups, null)
            self            = try(egress.value.self, false)
        }
    }

    tags = var.tags
}
