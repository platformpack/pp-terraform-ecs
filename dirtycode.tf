resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  prefix_list_ids   = "0.0.0.0/0"
  from_port         = 0
  security_group_id = "sg-123456"
}
