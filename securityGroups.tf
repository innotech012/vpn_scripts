resource "aws_security_group" "sbu_vpn_sg" {
  vpc_id = aws_vpc.sbu_vpn_vpc.id
  tags = {
    Name = "sbu_vpn_sg"
  }
}
resource "aws_security_group_rule" "sbu_vpn_sg_rule_443" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sbu_vpn_sg_rule_22" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sbu_vpn_sg_rule_943" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "ingress"
    from_port = 943
    to_port = 943
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sbu_vpn_sg_rule_1143" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "ingress"
    from_port = 1143
    to_port = 1143
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sbu_vpn_sg_rule_1194" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "ingress"
    from_port = 1194
    to_port = 1194
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "sbu_vpn_sg_rule_egress" {
    security_group_id = aws_security_group.sbu_vpn_sg.id
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}