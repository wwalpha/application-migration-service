#!/bin/bash

# Describe replication configuration template
ID=$(aws mgn describe-replication-configuration-templates | jq -r .items[0].replicationConfigurationTemplateID)

# Update staging area subnet
aws mgn update-replication-configuration-template \
  --replication-configuration-template-id $ID \
  --staging-area-subnet-id $SUBNET_ID \
  --data-plane-routing PRIVATE_IP \
  --no-create-public-ip \
  --ebs-encryption DEFAULT
