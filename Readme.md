# Creating an RDS Module in Terraform

## Overview

This project demonstrates how to create a reusable Terraform module for provisioning an Amazon RDS instance. The module includes validation for networking and security configurations to ensure best practices are followed.

## Features

- Modular structure for easy reuse and customization.
- Validation for input variables, including password complexity and networking requirements.
- Support for private subnets and secure security group configurations.
- Automated creation of necessary resources, including subnets, security groups, and the RDS instance.

## Steps taken to Implement

### 1. Understand the Requirements

- Identify the resources needed for the RDS instance (e.g., subnets, security groups, and IAM roles).
- Ensure the networking setup aligns with AWS best practices for RDS.

### 2. Create the Module

- Follow the standard Terraform module structure:
  - `networking-validation.tf`: Contains all the validation rules for validating the resources that we will be using in this project.
  - `provider.tf`: Contains the AWS provider information.
  - `variables.tf`: Define input variables with validation.
  - `outputs.tf`: Define outputs for the module.
  - `rds.tf`: Implement the main logic for the db instance creation.

### 3. Implement Variable Validation

- Add validation for critical variables, such as:
  - Password complexity for the RDS engine.
  - Subnet and security group IDs.

### 4. Networking Validation

- Ensure subnets meet the following criteria:
  - Subnets must not belong to the default VPC.
  - Subnets must be private (tagged with `Access=Private`).
- Validate security groups:
  - Ensure no inbound rules allow unrestricted IP addresses.

### 5. Create Resources

- Provision the necessary resources:
  - Subnets in multiple Availability Zones for high availability.
  - Security groups with compliant rules.
  - RDS instance with the specified engine, version, and networking configuration.

### 6. Test the Module

- Validate the module by running `terraform plan` and `terraform apply`.
- Ensure all validations are working as expected.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/terraform-rds-module.git
    cd terraform-rds-module
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Provide input variables:
    - Update the `terraform.tfvars` file with your configuration.

4. Run Terraform commands:
    - Plan the changes:

      ```bash
      terraform plan
      ```

    - Apply the configuration:

      ```bash
      terraform apply
      ```

5. Destroy resources when no longer needed:

    ```bash
    terraform destroy
    ```

## Best Practices

- Always validate input variables to avoid misconfigurations.
- Use private subnets for RDS instances to enhance security.
- Regularly review security group rules to ensure compliance.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
