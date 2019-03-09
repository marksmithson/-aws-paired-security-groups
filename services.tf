resource "aws_security_group" "application_service" {
  name = "application_service"
  description = "Security Group for the Application Service"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group" "user_service" {
  name = "user_service"
  description = "Security Group for the User Service"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group" "search_service" {
  name = "search_service"
  description = "Security Group for the Search Service"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group" "favourites_service" {
  name = "favourites_service"
  description = "Security Group for the Favourites Service"
  vpc_id = "${aws_vpc.markers.id}"
}

resource "aws_security_group_rule" "logstash_application_service" {
  type = "ingress"
  from_port = 500
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.logstash.id}"
  source_security_group_id = "${aws_security_group.application_service.id}"
  description = "Access to 5000 from application service"
}

resource "aws_security_group_rule" "logstash_user_service" {
  type = "ingress"
  from_port = 500
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.logstash.id}"
  source_security_group_id = "${aws_security_group.user_service.id}"
  description = "Access to 5000 from user service"
}
resource "aws_security_group_rule" "logstash_search_service" {
  type = "ingress"
  from_port = 500
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.logstash.id}"
  source_security_group_id = "${aws_security_group.search_service.id}"
  description = "Access to 5000 from search service"
}

resource "aws_security_group_rule" "logstash_favourites_service" {
  type = "ingress"
  from_port = 500
  to_port = 5000
  protocol = "tcp"
  security_group_id = "${aws_security_group.logstash.id}"
  source_security_group_id = "${aws_security_group.favourites_service.id}"
  description = "Access to 5000 from favourites service"
}