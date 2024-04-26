### Hands-On Lab: Fault Injection with Gremlin and AWS ECS

#### Objective:
This lab guides you through the process of signing up for the Gremlin fault injection service, deploying a containerized Spring Boot application on AWS ECS using Terraform, and creating fault injection experiments using Gremlin. By the end of this lab, you will understand how to simulate faults and observe their effects on your application in a controlled environment.

#### Prerequisites:
- Basic understanding of AWS services, especially ECS (Elastic Container Service) and Cloud9.
- Familiarity with Terraform for infrastructure as code.
- Basic knowledge of Docker and containerization.

#### Tools Required:
- AWS Account
- Gremlin Account (Free trial available)
- Terraform installed on your local machine or Cloud9 environment
- Internet browser

#### Part 1: Sign Up for Gremlin

1. **Navigate to Gremlin:**
   - Open your web browser and go to [Gremlin's website](https://www.gremlin.com/).
   - Click on the 'Free Trial' or 'Sign Up' button.

2. **Create Your Account:**
   - Fill in the registration form with your details including your name, company name, email, and password.
   - Agree to the terms of service and privacy policy, then submit the form.

3. **Verify Your Email:**
   - Check your email for a verification message from Gremlin.
   - Click on the verification link in the email to activate your account.

#### Part 2: Log into Cloud9

1. **Access AWS Cloud9:**
   - Log in to your AWS Management Console.
   - Navigate to the Cloud9 service under `Services` or search for Cloud9 in the search bar.

2. **Open Your IDE:**
   - Follow the instructions provided in your class to set up or access a pre-existing Cloud9 environment.
   - Ensure that your environment has internet access and the necessary permissions to manage AWS resources.

#### Part 3: Deploy Infrastructure with Terraform

1. **Initialize Your Project:**
   - In your Cloud9 environment, clone the provided Git repository containing the Terraform code for the ECS infrastructure:
     ```
     git clone [URL of the Git repository]
     cd [repository name]
     ```

2. **Review the Terraform Configuration:**
   - Examine the Terraform files to understand the resources being created, focusing on the ECS cluster, task definitions, and service configurations.

3. **Run Terraform:**
   - Initialize Terraform:
     ```
     terraform init
     ```
   - Plan the deployment to see the resources that will be created:
     ```
     terraform plan
     ```
   - Apply the configuration to create the infrastructure:
     ```
     terraform apply
     ```
   - Confirm the deployment when prompted.

#### Part 4: Create Experiments with Gremlin

1. **Log Into Gremlin:**
   - Go back to the Gremlin web interface and log in with your credentials.

2. **Install the Gremlin Agent:**
   - Follow the instructions on the Gremlin UI to install the Gremlin agent on your ECS instances. This may involve adding the Gremlin agent to your Docker containers or ECS task definitions.

3. **Create Your First Attack:**
   - In the Gremlin dashboard, select 'Scenarios' then 'Create Scenario'.
   - Add attacks such as resource exhaustion, network latency, or shutdown to your scenario.
   - Configure the magnitude and duration of each attack based on the lab requirements.

4. **Run the Scenario:**
   - Once your scenario is configured, start the attack and monitor its impact on your Spring Boot application using the metrics and logs in AWS CloudWatch or any other monitoring tool integrated into your setup.

5. **Observe and Document:**
   - Observe how your application behaves under stress. Take notes on any failures or unexpected behavior.
   - Document your findings and cleanup any resources if required.

#### Conclusion
This lab has provided hands-on experience with fault injection using Gremlin and the deployment of containerized applications using AWS ECS and Terraform. These skills are crucial for understanding and improving the resilience of applications in production environments.
