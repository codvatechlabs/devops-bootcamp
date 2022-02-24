#!/usr/bin/env python3
import boto3
AWS_REGION = "ap-south-1"
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
INSTANCE_ID = "i-0cb9c76f2e0eeb895"
instance = EC2_RESOURCE.Instance(INSTANCE_ID)
instance.stop()
