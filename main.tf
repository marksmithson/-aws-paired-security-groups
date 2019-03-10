provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "markers" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id = "${aws_vpc.markers.id}"
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "application" {
  name = "Application"
  description = "Security Group for the Application"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group_rule" "application_https" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = "${aws_security_group.application.id}"
  cidr_blocks = ["0.0.0.0/0"]
  description = "HTTPS from anywhere"
}

resource "aws_security_group" "logstash" {
  name = "Logstash"
  description = "Security Group for the Logstash Cluster"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group" "elasticsearch" {
  name = "Elasticsearch"
  description = "Security Group for the Elasticsearch Cluster"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group_rule" "elastic_9200" {
  type = "ingress"
  from_port = 9200
  to_port = 9200
  protocol = "tcp"
  security_group_id = "${aws_security_group.elasticsearch.id}"
  source_security_group_id = "${aws_security_group.logstash.id}"
  description = "Access to 9200 from Logstash"
}
