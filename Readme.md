# Creating an RDS module in Terraform

1. Understanding the RDS resource and what other resources that we need.
2. Creating the module with the standard structure.
    - Created the variables that we will use in the module and added validation to it as well.
3. Impleament the variable validation.
    - Made changes to the validation of the password for the engine.
4. Impleamenting networking validation.
    - Added variables for Subnets and Seecurity Groups.
    - Receive the subnet and security group ids via variables.
    - Make sure the subnet is not a default VPC, and that they are private.
    - We want to make sure there there are no inbound groups with inbound rules for IP addresses.
5. Create the necessary resources, and make sure the validation is working.
6. Create the RDS instance inside of the module.
