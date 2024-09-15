#creating ssh-key pair

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

# output "keyname" {
#     value = "${aws_key_pair.key-tf.key_name}"
# }