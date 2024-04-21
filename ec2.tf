resource "aws_instance" "vpc_instance" {
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t3.medium"
    key_name = aws_key_pair.generated_key.key_name
    security_groups = [aws_security_group.sbu_vpn_sg.id]
    subnet_id = aws_subnet.sbu_vpn_subnet.id
    associate_public_ip_address = true
    
    tags = {
        Name = "vpc_instance"
    }
}


resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits = 4096
}


resource "aws_key_pair" "generated_key" {
  key_name =  "generated_key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "null_resource" "output_private_key" {
  
  provisioner "local-exec" {
    command = "echo '${tls_private_key.example.private_key_pem}' > private_key.pem"
    
  }
}


output "public_ip_instance" {
    value = aws_instance.vpc_instance.public_ip
}