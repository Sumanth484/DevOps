# AWS EC2 creation Manual and using AWS CLI

## Manual EC2 Instance Creation Steps:

1. **Log in to AWS Console:**
   - Open your web browser and navigate to the AWS Management Console.
   - Log in with your AWS account credentials.

2. **Navigate to EC2 Dashboard:**
   - In the AWS Management Console, find and select the `EC2` service from the list of available services.

3. **Launch Instance:**
   - Click on the `Instances` link in the EC2 Dashboard to view existing instances or launch a new one.
   - Click on the `Launch Instance` button to start the instance creation wizard.

4. **Choose an Amazon Machine Image (`AMI`):**
   - Select an `AMI` based on your requirements (e.g., Amazon Linux, Ubuntu, Windows Server).

5. **Choose Instance Type:**
   - Choose the instance type based on your workload needs (e.g., `t2.micro`, `m5.large`).

6. **Configure Instance:**
   - Configure instance details such as number of instances, network settings (`VPC`, subnet), and storage (`EBS` volumes).

7. **Add Storage:**
   - Specify the size and type of `EBS` volumes (if needed) for your instance.

8. **Configure Security Group:**
   - Create or select an existing security group to define inbound and outbound rules (e.g., `SSH`, `HTTP`, `HTTPS`).

9. **Review and Launch:**
   - Review your instance configuration details.
   - Optionally, add tags for easier instance management.
   - Click "Launch" and select or create a key pair to securely connect to your instance.
   - 

## Automated EC2 Instance Creation Steps using AWS CLI:

1. **Install AWS CLI:**
   - Download and install AWS CLI on your local machine. Follow the installation instructions provided by AWS for your operating system.
   
     ```sh
     sudo apt update
     sudo apt upgrade awscli
     ```
2. **Configure AWS CLI:**
   - Use `aws configure` command to set up AWS CLI with your AWS credentials (`Access Key ID`, `Secret Access Key`, region, and output format).

3. **Create EC2 Instance:**
   - AWS CLI commands (`aws ec2 run-instances`) to automate instance creation.
    ```sh
     aws ec2 run-instances --image-id <your-ami-id> --instance-type <instance-type> --subnet-id <subnet-id> --security-group-ids <security-group-ids> --key-name <key-pair-name>
    ```
   - Specify parameters such as `AMI` ID, instance type, subnet ID, security group IDs, etc., within your script.
   - Monitor the output for any errors or confirm successful instance creation.

## SSH Connection Steps to EC2 Instance:

1. **Prepare SSH Key Pair:**
   - Ensure you have an `SSH` key pair (`.pem` file) created either during instance launch (for manual creation) or beforehand (for automated creation).

2. **Locate Instance Public `IP`:**
   - In the AWS Management Console, navigate to EC2 Dashboard and locate the public `IP` address or public `DNS` name of your EC2 instance.

3. **Connect Using `SSH`:**
   - Open your terminal or `SSH` client (e.g., MobaXterm, PuTTY on Windows, Terminal on macOS/Linux).
   - Set permissions for your private key file using `chmod 400 your-key.pem` (replace `your-key.pem` with your actual key file).

4. **Connect to Instance:**
   - Use the `SSH` command to connect to your EC2 instance:
     ```
     ssh -i /path/to/your-key.pem ec2-user@your-instance-public-ip
     ```
     - Replace `/path/to/your-key.pem` with the path to your private key file.
     - Replace `ec2-user` with the appropriate username for your `AMI` (e.g., `ubuntu` for Ubuntu `AMIs`, `ec2-user` for Amazon Linux).

5. **Manage Your Instance:**
   - Once connected via `SSH`, you can manage your EC2 instance by executing commands, uploading/downloading files, configuring software, etc.
     

## Most Used AWS CLI commands to fetch resources and create resources

### General

- `aws configure` - Set up AWS credentials and region
- `aws sts get-caller-identity` - Get current user identity

### S3

- `aws s3 ls` - List buckets
- `aws s3 mb <bucket_name>` - Create a bucket
- `aws s3 rm <bucket_name>` - Delete a bucket
- `aws s3 cp <file> s3://<bucket_name>/<key>` - Upload file to S3
- `aws s3 sync <local_dir> s3://<bucket_name>/<prefix>` - Sync local directory with S3

### EC2

- `aws ec2 describe-instances` - List instances
- `aws ec2 run-instances <image_id>` - Launch an instance
- `aws ec2 stop-instances <instance_id>` - Stop an instance
- `aws ec2 start-instances <instance_id>` - Start an instance
- `aws ec2 terminate-instances <instance_id>` - Terminate an instance

### IAM

- `aws iam list-users` - List users
- `aws iam create-user <user_name>` - Create a user
- `aws iam list-roles` - List roles
- `aws iam create-role <role_name>` - Create a role

