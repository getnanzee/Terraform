resource "aws_instance" "elastic-master" {
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "t2.micro"

  root_block_device {
      volume_size = 30
  }

  key_name = "${aws_key_pair.elastickey.key_name}"

  connection {
      user = "${var.INSTANCE_USER}"
      private_key = "${file("${var.PRIVATE_KEY}")}"
  }

  provisioner "local-exec" {
      command = "echo 'echo Master=${aws_instance.elastic-master.private_ip} >> /etc/environment' >> ips.sh ; echo Master ansible_host=${aws_instance.elastic-master.public_ip} >> hosts"
  }

  user_data = "${file("script.sh")}"

  tags {
      Name = "elastic-master"
  }
}

resource "aws_instance" "elastic-node-1" {
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "t2.micro"

  root_block_device {
      volume_size = 30
  }
  key_name = "${aws_key_pair.elastickey.key_name}"

  connection {
      user = "${var.INSTANCE_USER}"
      private_key = "${file("${var.PRIVATE_KEY}")}"
  }

  provisioner "local-exec" {
      command = "echo 'echo Node1=${aws_instance.elastic-node-1.private_ip} >> /etc/environment' >> ips.sh ; echo Node1 ansible_host=${aws_instance.elastic-node-1.public_ip} >> hosts"
  }

  user_data = "${file("script.sh")}"

  tags {
      Name = "elastic-node-1"
  }
}

resource "aws_instance" "elastic-node-2" {
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "t2.micro"

  root_block_device {
      volume_size = 30
  }
  key_name = "${aws_key_pair.elastickey.key_name}"

  connection {
      user = "${var.INSTANCE_USER}"
      private_key = "${file("${var.PRIVATE_KEY}")}"
  }

  provisioner "local-exec" {
      command = "echo 'echo Node2=${aws_instance.elastic-node-2.private_ip} >> /etc/environment' >> ips.sh ; echo Node2 ansible_host=${aws_instance.elastic-node-2.public_ip} >> hosts"
  }

  user_data = "${file("script.sh")}"

  tags {
      Name = "elastic-node-2"
  }
}

resource "aws_key_pair" "elastickey" {
  key_name = "elastic"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}