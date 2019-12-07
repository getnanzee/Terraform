resource "aws_instance" "elastic-master" {
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "t2.micro"

  key_name = "${aws_key_pair.elastickey.key_name}"

  connection {
      user = "${var.INSTANCE_USER}"
      private_key = "${file("${var.PRIVATE_KEY}")}"
  }
}

resource "aws_instance" "elastic-node-1" {
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "t2.micro"

  key_name = "${aws_key_pair.elastickey.key_name}"

  connection {
      user = "${var.INSTANCE_USER}"
      private_key = "${file("${var.PRIVATE_KEY}")}"
  }

}

resource "aws_key_pair" "elastickey" {
  key_name = "elastic"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}
