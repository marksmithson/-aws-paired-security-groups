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