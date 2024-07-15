# AWS Networking Project Setup Steps

1. **Create VPC by assigning CIDR**

   - **Tasks**:
     - Navigate to the AWS Management Console and go to the `VPC` dashboard.
     - Click on "`Create VPC`" and specify a `CIDR block` (e.g., `10.0.0.0/16`).

2. **Create two subnets in different Availability Zones with CIDR**

   - **Tasks**:
     - In the `VPC` dashboard, go to "`Subnets`".
     - Click on "`Create subnet`".
     - Choose your `VPC`, specify a `CIDR block` for each subnet (e.g., `10.0.1.0/24` and `10.0.2.0/24`).
     - Select different `Availability Zones` for each subnet.

3. **Create an internet gateway and attach it to VPC**

   - **Tasks**:
     - In the `VPC` dashboard, go to "`Internet Gateways`".
     - Click on "`Create internet gateway`".
     - Attach the `internet gateway` to your `VPC`.

4. **Create a route to the internet gateway**

   - **Tasks**:
     - In the `VPC` dashboard, go to "`Route Tables`".
     - Find the `Route table` attatched to your `Subnets`
     - Add a route (`0.0.0.0/0`) pointing to the `internet gateway`.

5. **Create a common web security group**

   - **Tasks**:
     - In the `EC2` dashboard, go to "`Security Groups`".
     - Click on "`Create Security Group`".
     - Define `inbound rules` to allow `HTTP` (port `80`) from `load balancer security group` and `SSH` (port `22`) traffic.
     - Associate this `security group` with both `EC2 instances`.
    
6. **Create two EC2 instances in two subnets**

   - **Tasks**:
     - In the `EC2` dashboard, click on "`Launch Instance`".
     - Choose an `AMI`, `instance type`, configure `instance details`.
     - Select the `subnet` for each instance (one instance per subnet).
     - Attatch two `EC2` instances with `security group`.

7. **Create a target group with the two EC2 instances created**

   - **Tasks**:
     - In the `EC2` dashboard, go to "`Target Groups`".
     - Click on "`Create Target Group`".
     - Choose "`Target Type`" as "`Instances`" and select your instances.
     - Configure `health checks` and `protocols`.

8. **Create load balancer security group**

   - **Tasks**:
     - In the `EC2` dashboard, go to "`Security Groups`".
     - Click on "`Create Security Group`".
     - Define `inbound rules` to allow `HTTP` traffic (port `80`) from anywhere.
     - Associate this `security group` with your `load balancer`.

9. **Create a load balancer and target it to the target group**

   - **Tasks**:
     - In the `EC2` dashboard, go to "`Load Balancers`".
     - Click on "`Create Load Balancer`".
     - Choose "`Application Load Balancer`".
     - Configure `listeners` (e.g., `HTTP` on port `80`) and associate them with the `target group`.

10. **Check for NACL rules and Security Group rules**

    - **Tasks**:
      - In the `VPC` dashboard, go to "`Network ACLs`".
      - Review the default `NACL rules` and `Security group rules` and ensure they allow necessary `inbound` and `outbound traffic` (e.g., `HTTP`, `SSH`).
      - Adjust `NACL rules` if needed.

11. **Log in to EC2 instances and run the Python HTTP server which shows directory structure**

    - **Tasks**:
      - Use `SSH` to connect to each `EC2 instance`.
      - Create a folder with different names in two instances (or) Navigate to the directory where your web files are located.
      - Run the `Python HTTP server`: ```sudo python3 -m http.server```.

   ![web1-traffic](https://github.com/user-attachments/assets/5bfbb387-f11a-4fd5-bdd5-22cfda0afe3e)


12. **Access the server using the load balancer DNS name**

    - **Tasks**:
      - Copy the `DNS name` of your `load balancer` from the `AWS Management Console`.
      - Open a web browser and navigate to the `DNS name` (e.g., `http://your-load-balancer-dns-name/`).
      - Verify that you can access the `directory structure` served by the `Python HTTP server` running on your `EC2 instances` and observe the `load balancing`.

You can observe in below images the same `load balancer` is being used and `routing traffic` to both `instances`.

![web1](https://github.com/user-attachments/assets/90ae18d4-7416-4ceb-866b-b148f91a85a4)

![web2](https://github.com/user-attachments/assets/05242115-66fb-40ac-8a1e-b11e8e3ca8dc)



