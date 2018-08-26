#!/bin/bash

#This is for branch you know? :D

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."
     aws ec2 describe-instances --query "Reservations[*].Instances[*].{IP:PublicIpAddress,ID:InstanceId,Type:InstanceType,State:State.Name,Name:Tags[0].Value}" --output=table --region $region
done


#OK I made changes again