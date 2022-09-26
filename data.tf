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
        Name = "mco-dev-vpc"
      }
    }
     
     
    # Fetch NLB Subnets
    data "aws_subnet_ids" "getsubnets" {
      vpc_id = data.aws_vpc.getvpcid.id
      tags = {
          Name = "mco-dev-sn-cmp"
        }
      }
     
    
    #Fetch nginx SG
    data "aws_security_group" "getsgid" {
      tags = {
        Name = "mco-dev-sg-cmp"
      }
    }
     
     
    data "aws_eip" "eip_mco_basic" {
      tags = {
        Name = "eip-mco-basic"
      }
    }
     
    
    #Fetch default aws kms key arn for ebs encryption
    #data "aws_kms_key" "by_alias" {
    #  key_id = "alias/aws/ebs"
    #}
