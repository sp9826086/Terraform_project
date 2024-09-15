#creating EC2 instance

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = {
    Name = "second-tf-instance"
  }
  user_data = file("${path.module}/script.sh")

  #Three type of provisioner- file, local-exec, remote-exec
  #file provisioner is used to copy file from local to remote server
  #local-exec provisioner is used to execute local command
  #remote-exec provisioner is used to execute remote command

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "readme.md"      #terraform machine
    destination = "/tmp/readme.md" #remote machine

    #for specific provisioner connection should be written in below way:

    # connection {
    #   type        = "ssh"
    #   user        = "ubuntu"
    #   private_key = file("${path.module}/id_rsa")
    #   host        = self.public_ip
    # }
  }

  provisioner "file" {
    content     = "This is my new content" #terraform machine
    destination = "/tmp/content.md"        #remote machine

  }

  provisioner "local-exec" {
    command = "echo 'at Create' "
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete' "
  }

  # provisioner "local-exec" {
  #   interpreter = [ 
  #     "C:/Users/Piyush Kumar Singh/AppData/Local/Programs/Python/Python312/python.exe", "-c"
  #    ]
  #   command = "print('hello world') "
  # }

}

