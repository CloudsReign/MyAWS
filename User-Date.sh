#!/bin/bash
# Update package list and install Apache
dnf update -y
dnf install -y httpd

# Start and enable Apache service
systemctl start httpd
systemctl enable httpd

# Set permissions for Apache root directory
chown -R ec2-user:ec2-user /var/www/html

# Create a custom index.html page with branding
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Custom Apache Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
            max-width: 800px;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
        ul {
            text-align: left;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to My Custom Apache Web Server!</h1>
        <p>Hosted on an <strong>Amazon Linux 2023 EC2 Instance</strong>.</p>
        <p>This site was deployed using automated provisioning techniques via AWS EC2 User Data to showcase my skills in infrastructure-as-code.</p>
        <hr>
        <h2>About Me</h2>
        <p>I’m a Technical Manager and Cloud Engineer with over 25 years of experience in telecom, cloud, and systems engineering. I specialize in <strong>Avaya, Cisco, and AWS</strong> technologies, with a strong background in automation, uptime optimization, and client success.</p>
        <p>Certifications include:</p>
        <ul>
            <li>AWS Certified Solutions Architect</li>
            <li>AWS DevOps Engineer</li>
            <li>CompTIA Cloud+</li>
        </ul>
        <p>I’m passionate about building resilient infrastructure, streamlining operations, and mentoring engineers to reach their full potential.</p>
        <hr>
        <h2>Let's Connect</h2>
        <p>Check out my work on <a href="https://github.com/CloudsReign" target="_blank">GitHub</a>, or <a href="mailto:luteschristian@gmail.com">email me</a> to get in touch.</p>
    </div>
</body>
</html>
EOF

# Restart Apache to apply changes
systemctl restart httpd
