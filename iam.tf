#IAM EC2 Role
resource "aws_iam_role" "elasticsearch-role" {
  name = "elasticsearch-role"
  
  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
  EOF

  tags={
      Name = "CustomElasticSearchRole"
  }
}

#IAM EC2 Policy to Describe Instance
resource "aws_iam_policy" "elasticsearch-policy" {
  name        = "elasticsearch-policy"
  description = "Policy to discover ec2 instances in elasticsearch"

  policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement" : [
            {
                "Effect": "Allow",
                "Action": "ec2:DescribeInstances",
                "Resource": "*"
            }
        ]
    }
  EOF
}

#Associate Policy with Role
resource "aws_iam_role_policy_attachment" "role-binding" {
  role       = "${aws_iam_role.elasticsearch-role.name}"
  policy_arn = "${aws_iam_policy.elasticsearch-policy.arn}"
}

#Role association with EC2
resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2-profile"
  role = "${aws_iam_role.elasticsearch-role.name}"
}