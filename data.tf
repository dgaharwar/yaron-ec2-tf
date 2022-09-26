    provider "aws" {
      region = "us-east-1"
      access_key = "AKIAV3MRAQDIBNP3PGJN"
      secret_key = "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"
    }
     
    #Fetch VPC ID
    data "aws_vpc" "getvpcid" {
      tags = {
        Name = "vpc-33ac354e"
      }
    }
     
     
    # Fetch NLB Subnets
    data "aws_subnet_ids" "getsubnets" {
      vpc_id = data.aws_vpc.getvpcid.id
      tags = {
          Name = "subnet-ed6462e3"
        }
      }
     
    #Fetch nginx SG
    data "aws_security_group" "getsgid" {
      tags = {
        Name = "sg-2b299333"
      }
    }
     
     
    data "aws_eip" "eip_mco_basic" {
      tags = {
        Name = "eip-mco-basic"
      }
    }
     
    #Fetch default aws kms key arn for ebs encryption
    data "aws_kms_key" "by_alias" {
      key_id = "alias/aws/ebs"
    }