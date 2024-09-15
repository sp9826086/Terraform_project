data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  # name = ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240801
  # filter = ebs
  #virtualization = hvm

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
