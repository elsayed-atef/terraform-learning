data "aws_ami" "ec2-ami" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["packer-test"]
  }
  most_recent = true
}

resource "aws_instance" "ec2" {
  ami                  = "${data.aws_ami.ec2-ami.id}"
  instance_type        = "t2.micro"
  key_name             = "${var.key_name}"
  iam_instance_profile = "${var.iam_instance_profile}"
  tags = {
    Name = "PackerAMI"
  }
}
