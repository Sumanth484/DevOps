# Hosting a static web Application.

Repo consists of static web applications developed using HTML,CSS and JS.
Follow the below steps to deploy and host any static web appliication using Apache server in EC2 instance.

# Steps to Deploy a Static Website on an EC2 Instance Using Apache2

## Step 1: Launch an EC2 instance and store the PEM file

## Step 2: Connect to EC2 instance using SSH by executing the command below

```bash
ssh -i <path to your-key-pair.pem> ubuntu@<your-ec2-public-ip>
```
## Step 3: Update the apt packages and install Apache2 server

```bash
sudo apt update
sudo apt install apache2 -y
```
## Step 4: Start and enable Apache server

```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```
## Step 5: Clone the repository using the command below

```bash
git clone https://github.com/Sumanth484/Static-Websites-Hosting-AWS.git
```
## Step 6: Copy the contents of any one of the websites and place them in the Apache server hosting path

```bash
sudo rm -rf /var/www/html/*
sudo cp -r /home/ubuntu/Static-Websites-Hosting-AWS/Amazon\ Clone/* /var/www/html/
```
## Step 7: By default, Apache server hosts the index.html file. Make sure 'i' in index.html is lowercase.

Execute the below command to change the name from `Index.html` to `index.html`.

```bash
sudo mv Index.html index.html
```

## Step 9: Allow the HTTP Traffic

By default the website is hosted on port 80. So Allow the HTTP traffic through port 80 by modifying inbound rules of the security group.
    
## Step 10: Restart the Apache system service

```bash
sudo systemctl restart apache2
```

## Step 11: Accessing the Application

Now access the web Application with <Instance 'public IP'>:80 
