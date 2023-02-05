    terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "Free_Aws"
        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "terraformAwsNginxHelloMel"
        }
      }
    }