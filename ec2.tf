resource "aws_instance" "app" {
  ami                    = "ami-0c02fb55956c7d316"  
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
            
              yum install -y httpd
              echo "<h1>Deployed from Terraform</h1>" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
          EOF

  tags = {
    Name = "AppServer"
  }
}

