resource "random_id" "suffix" {
  # Random ID for unique resource names
  byte_length = 4
}

# --- Shared Security Group ---
resource "aws_security_group" "app_sg" {
  name        = "pso-demo-sg-${random_id.suffix.hex}"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.book_library_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with a safe IP range
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App (Port 3000)"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] # Allow IPv6 traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- EC2 ---
resource "aws_instance" "server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true

  # iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = "pso-demo-${random_id.suffix.hex}"
    Environment = "staging"
    Project     = var.project_name
  }

  user_data = <<-EOF
              #!/bin/bash -xe
              exec > /var/log/user-data.log 2>&1

              # Update system
              apt-get update && apt-get upgrade

              # Install basic packages
              apt install -y curl unzip

              # Install Node.js 22.x (required for Next.js)
              curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
              sudo apt install -y nodejs

              # Install AWS CLI v2 for S3 artifact access
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip awscliv2.zip
              sudo ./aws/install

              # Install PM2 globally for Next.js process management
              npm install -g pm2

              # Create deploy directory for Next.js frontend
              mkdir -p /home/ubuntu/deploy
              chown ubuntu:ubuntu /home/ubuntu/deploy

              # Create PM2 log directory
              mkdir -p /var/log/pm2
              chmod 755 /var/log/pm2

              # Configure PM2 to auto-start on system boot
              sudo -u ubuntu pm2 startup || true
              
              echo "✅ EC2 instance ready for Next.js deployment"
              EOF
}
