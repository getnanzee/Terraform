resource "aws_instance" "elastic-instance" {
  
  count = length(var.NODES)
  ami = "${lookup(var.AMIS, var.REGION)}"
  instance_type = "${var.INSTANCE_TYPE}"

  root_block_device {
      volume_size = 30
  }

  key_name = "${aws_key_pair.elastickey.key_name}"

  provisioner "local-exec" {
    command = "echo ${var.NODES[count.index]} ansible_host=${self.public_ip} >> hosts"
  }

  iam_instance_profile = "${aws_iam_instance_profile.ec2-profile.name}"

  user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install python -y
            echo "nodename=${var.NODES[count.index]}" >> /etc/environment
  EOF

  tags = {
      Name = var.NODES[count.index]
      es_cluster = "es"
  }
}

resource "aws_key_pair" "elastickey" {
  key_name = "${var.PRIVATE_KEY}"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}