#!/bin/bash

# Log all user-data execution output
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting EC2 User Data execution..."

# Prefer IPv4 over IPv6 (fix apt network issue)
echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf

echo "Updating packages..."
apt update -y

echo "Installing Apache..."
apt install -y apache2

echo "Installing AWS CLI..."
apt install -y awscli


# Get EC2 Instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)


# Create website page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>

<head>

<title>AWS Terraform Cloud Demo</title>

<style>

body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 80px;
    background-color: #f4f6f7;
}

h1 {
    animation: colorChange 3s infinite;
}

h2 {
    color: green;
}

.container {
    background:white;
    padding:40px;
    margin:auto;
    width:60%;
    border-radius:10px;
}

@keyframes colorChange {

0% {
    color:red;
}

50% {
    color:green;
}

100% {
    color:blue;
}

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
Welcome to my AWS Cloud Engineering Lab 🚀
</p>


<p>
This infrastructure was provisioned automatically using:
</p>


<p>
<b>
AWS EC2 + Terraform + User Data + Apache Web Server
</b>
</p>


<p>
Environment:
<b>
Production Simulation
</b>
</p>


</div>

</body>

</html>
EOF


# Enable and restart Apache

systemctl enable apache2

systemctl restart apache2


echo "Apache installation completed successfully"

systemctl status apache2 --no-pager

echo "User Data execution completed"