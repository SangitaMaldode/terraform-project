#!/bin/bash

# Enable user-data logging for troubleshooting
exec > /var/log/user-data.log 2>&1

echo "Starting EC2 User Data execution"

# Prefer IPv4 to avoid apt IPv6 connectivity issue
echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf

# Update packages
apt update -y

# Install Apache
apt install -y apache2

# Get EC2 Instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install AWS CLI
apt install -y awscli


# Download images from S3 bucket (enable when required)
# aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read


# Create HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>

<head>

<title>My Portfolio</title>

<style>

body {
  font-family: Arial, sans-serif;
  text-align: center;
  margin-top: 80px;
  background-color: #f5f5f5;
}

.container {
  background: white;
  padding: 40px;
  width: 60%;
  margin: auto;
  border-radius: 10px;
}

@keyframes colorChange {
  0% { color: red; }
  50% { color: green; }
  100% { color: blue; }
}

h1 {
  animation: colorChange 3s infinite;
}

h2 {
  color: green;
}

</style>

</head>


<body>

<div class="container">

<h1>
Terraform Project Server 1
</h1>


<h2>
Instance ID:
<span>
$INSTANCE_ID
</span>
</h2>


<p>
Welcome to my Cloud Engineering Lab 🚀
</p>


<p>
Built using:
</p>


<p>
<b>
AWS EC2 + Terraform + User Data + Apache Automation
</b>
</p>


<p>
This server was provisioned automatically through Infrastructure as Code.
</p>


</div>

</body>

</html>
EOF


# Start Apache service
systemctl enable apache2
systemctl restart apache2


echo "Apache setup completed successfully"

systemctl status apache2 --no-pager