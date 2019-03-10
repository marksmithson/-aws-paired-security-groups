# AWS Paired Security Groups

This repository contains terrform code for the article https://mark.smithson.me/paired-security-groups-in-aws

Different states for the infrastructure can be achieved by checking out different branches and running `terraform apply`

Please note that the `microservices-paired` branch will create a n2.nano instance in your AWS account. Please make sure you run `terraform destroy` when you are finished to avoid charges.