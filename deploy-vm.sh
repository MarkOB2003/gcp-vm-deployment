#!/bin/bash

# Variables
PROJECT_ID="cloud-vm-project-452819"
INSTANCE_NAME="my-vm-instance"
ZONE="us-east1-b"
MACHINE_TYPE="e2-standard-2"  # 2 vCPUs, 8GB RAM
DISK_SIZE="250GB"
IMAGE_FAMILY="ubuntu-2004-lts"
IMAGE_PROJECT="ubuntu-os-cloud"
FIREWALL_RULE_NAME="allow-http-ssh"
STATIC_IP_NAME="my-static-ip"

# Step 1: Create a static external IP address
echo "Creating static IP address..."
gcloud compute addresses create $STATIC_IP_NAME --region=${ZONE%-*} --project=$PROJECT_ID

# Get the static IP address
STATIC_IP=$(gcloud compute addresses describe $STATIC_IP_NAME --region=${ZONE%-*} --format="value(address)")

# Step 2: Create the VM instance
echo "Creating VM instance..."
gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --create-disk=size=$DISK_SIZE,image-family=$IMAGE_FAMILY,image-project=$IMAGE_PROJECT \
    --tags=http-server,https-server \
    --address=$STATIC_IP

# Step 3: Configure firewall rules
echo "Configuring firewall rules..."
gcloud compute firewall-rules create $FIREWALL_RULE_NAME \
    --project=$PROJECT_ID \
    --allow=tcp:80,tcp:22 \
    --target-tags=http-server,https-server

# Output the details
echo "VM instance created successfully!"
echo "Instance Name: $INSTANCE_NAME"
echo "Static IP: $STATIC_IP"
echo "Zone: $ZONE"