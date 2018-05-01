#!/usr/bin/env bash

apt-get update
apt-get upgrade --yes
apt-get install --yes nginx

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>My First Load Balanced Website</title>
</head>
<body>
 <header>
  <h1>My First Load Balanced Website</h1>
 </header>
 <main>
  <p>Welcome to my first load-balanced website created using Terraform only. It's
     hosted in AWS on four <span style="font:monospace">t2.micro</span> servers
     connected to an <a href="https://aws.amazon.com/elasticloadbalancing/">Application
     Load Balancer</a>, all configured for high-availability. If one AZ goes down,
     this site will keep on running!<p>
  <pre>Created by ${name}, this page is being served from ${server}</pre>
 </main>
</html>
EOF

systemctl enable nginx
systemctl restart nginx

