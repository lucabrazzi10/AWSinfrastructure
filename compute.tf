resource "aws_instance" "instance_1" {
  ami             = var.ami
  instance_type   = var.instance_type[0]
  security_groups = [aws_security_group.web_sg.id]
  subnet_id     = aws_subnet.subnet_a.id
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_2" {
  ami             = var.ami
  instance_type   = var.instance_type[1]
  security_groups = [aws_security_group.web_sg.id]
  subnet_id     = aws_subnet.subnet_b.id
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF
}
