    #-------------------------------------------------------LOCAL VARIABLES------------------------------------------------
    locals {
      vpc_id = data.aws_vpc.getvpcid.id
    }
    #----------------------------------------------------------------End of Local Variables----------------------------------
     
    resource "aws_instance" "ec2-jen-morp" {
       ami = "ami-08d4ac5b634553e16"
       instance_type = "t2.micro"
       subnet_id = flatten(data.aws_subnet_ids.getsubnets.ids)[0]
       associate_public_ip_address = "true"
       key_name = "MorpheusApp"
       vpc_security_group_ids = [data.aws_security_group.getsgid.id]
       user_data = file("webuserdata.sh")
    }
     
    resource "aws_eip_association" "eip_assoc" {
      instance_id   = aws_instance.ec2-jen-morp.id
      allocation_id = data.aws_eip.eip_mco_basic.id
    }