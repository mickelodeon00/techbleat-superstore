

resource "aws_instance" "web_server" {
  ami           = "ami-09c54d172e7aa3d9a"
  instance_type = "t3.micro"
  key_name      = var.key_pair_name
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  
  user_data = file("user_data.sh")
  
  tags = {
    Name = "techbleat-web-server"
  }
}