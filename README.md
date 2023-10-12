# Instructions

1. Create a directory to house this project in then switch to that directory

   ``
   mkdir S3-Project; cd S3-Project
   ``

2. Create two empty .tf files named provider.tf & s3-bucket.tf. Then open text editors to begin configuration task
   
   ``
   touch provider.tf s3-bucket.tf; code provider.tf rds.tf
   ``

3.  Once files have necessary information needed to deploy infrastructure; run the following commands to initialize terraform in current directory, validate syntax of file, and build infrastructure

    ``
    terraform init; terraform validate/plan; terraform apply -auto-apply
    ``

4. Login to AWS Console -> Go to S3 and see created bucket with objects/files uploaded to it


5. Can choose to terraform destroy everything but I changed code and made everything private
 
   ``
   terraform destroy
   ``

# Resources
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
