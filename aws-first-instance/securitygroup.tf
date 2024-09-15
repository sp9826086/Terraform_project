#creating security group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  #Dynamic is short way for ingress & engress

  dynamic "ingress" {
    for_each = ["22", "80", "443", "3306", "27017"]
    iterator = port
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  #long way for ingress

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   from_port   = 22
  #   protocol    = "tcp"
  #   to_port     = 22
  # }

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   from_port   = 80
  #   protocol    = "tcp"
  #   to_port     = 80
  # }

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   from_port   = 443
  #   protocol    = "tcp"
  #   to_port     = 443
  # }

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   from_port   = 3306
  #   protocol    = "tcp"
  #   to_port     = 3306
  # }

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   from_port   = 27017
  #   protocol    = "tcp"
  #   to_port     = 27017
  # }

}
