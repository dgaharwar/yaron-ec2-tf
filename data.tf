    provider "aws" {
      region = var.region
      access_key = var.access_key
      secret_key = var.secret_key
    }
    
    variable "region" {}
    variable "access_key" {}
    variable "secret_key" {}
    
    
    #Fetch VPC ID
    data "aws_vpc" "getvpcid" {
      tags = {
        Name = "myVpc"
      }
    }
     
     
    # Fetch NLB Subnets
    data "aws_subnet_ids" "getsubnets" {
      vpc_id = data.aws_vpc.getvpcid.id
      tags = {
          Name = "myDefaultSubnet"
        }
      }
     
    
    #Fetch nginx SG
    data "aws_security_group" "getsgid" {
      tags = {
        Name = "vpc-33ac354e"
      }
    }
     
     
    data "aws_eip" "eip_mco_basic" {
      tags = {
        Name = "eip-mco-basic"
      }
    }
     
    
    Fetch default aws kms key arn for ebs encryption
    data "aws_kms_key" "by_alias" {
      key_id = "alias/aws/ebs"
    }
