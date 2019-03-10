resource "aws_security_group" "log_sender" {
  name = "Log Sender"
  description = "Security Group for the Instances which send logs"
  vpc_id = "${aws_vpc.markers.id}"
}

data "aws_ami" "aws" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-gp2"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "application-service" {
  ami           = "${data.aws_ami.aws.id}"
  instance_type = "t2.nano"
  subnet_id = "${aws_subnet.main.id}"
  vpc_security_group_ids = ["${aws_security_group.application_service.id}", "${aws_security_group.log_sender.id}"]
}

resource "aws_security_group_rule" "logstash_logsender" {
  type = "ingress"
  from_port = 5000
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.logstash.id}"
  source_security_group_id = "${aws_security_group.log_sender.id}"
  description = "from log_sender"
}

resource "aws_security_group_rule" "logsender_logstash" {
  type = "egress"
  from_port = 5000
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.log_sender.id}"
  source_security_group_id = "${aws_security_group.logstash.id}"
  description = "to log_sender"
}