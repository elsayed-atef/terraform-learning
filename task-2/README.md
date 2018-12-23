# Packer Terraform Ansible Python
# how to run :- 
  - As the first task you need to export some variables
       -  export AWS_SECRET_ACCESS_KEY=xxx
       -  export AWS_ACCESS_KEY_ID=xxx
       -  export AWS_REGION=xxx
       -  export AMI_NAME=xxx
       -  export TF_VAR_database_password=xxx
       -  export TF_VAR_database_user_name=xxx
       
  TF_VAR_database is needed by terrafom

  - Validate packer template   
      RUN `packer validate packer-ec2.json`
  - To apply
      RUN `packer apply packer-ec2.json`
      
  after the you will have an AMI , to create an EC2 from that AMI 
  
  add ` ec2-vars.tf ` , ` packer-ec2.tf ` to the parent directory
  
  RUN `terraform plan`
  RUN `trraform update` 
