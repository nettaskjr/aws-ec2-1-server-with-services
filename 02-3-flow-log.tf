data "template_file" "assume_role_policy" {
  template = file("polices/flow-logs-asume-role-policy.json")
}

data "template_file" "log_policy" {
  template = file("polices/flow-logs-log-policy.json")
}

resource "aws_iam_role" "iam_log_role" {
  name               = "AWS${var.client}-FLR" # funcao
  description        = "Geração de Logs de acesso a VPC"
  assume_role_policy = data.template_file.assume_role_policy.rendered
}

resource "aws_iam_role_policy" "log_policy" {
  name   = "${var.client}-FLP" # politica
  role   = aws_iam_role.iam_log_role.id
  policy = data.template_file.log_policy.rendered
}

resource "aws_cloudwatch_log_group" "flow_log_group-accept" {
  name = "${var.client}-CLG-ACCEPT" # Log de aceitos
}

resource "aws_flow_log" "vpc_flow_log-accept" {
  log_destination = aws_cloudwatch_log_group.flow_log_group-accept.arn
  iam_role_arn    = aws_iam_role.iam_log_role.arn
  vpc_id          = aws_vpc.vpc.id
  traffic_type    = "ACCEPT"
}

resource "aws_cloudwatch_log_group" "flow_log_group-reject" {
  name = "${var.client}-CLG-REJECT" # Log de rejeitados
}

resource "aws_flow_log" "vpc_flow_log-reject" {
  log_destination = aws_cloudwatch_log_group.flow_log_group-reject.arn
  iam_role_arn    = aws_iam_role.iam_log_role.arn
  vpc_id          = aws_vpc.vpc.id
  traffic_type    = "REJECT"
}