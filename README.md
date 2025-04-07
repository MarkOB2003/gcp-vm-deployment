## Prerequisites

Before running the script, ensure the following:

1. **Google Cloud SDK**:
   - Install the Google Cloud SDK: [Installation Guide](https://cloud.google.com/sdk/docs/install).
   - Authenticate using:
     ```bash
     gcloud auth login
     ```

2. **Google Cloud Project**:
   - Create a Google Cloud project and enable the following APIs:
     - Compute Engine API
     - IAM API
   - Enable the APIs using:
     ```bash
     gcloud services enable compute.googleapis.com iam.googleapis.com
     ```
     
3. **Git Bash Console**:
   -Install Git Bash


## Setup
Before runing the script, do the following:

1. Run Google Cloud SDK Shell

2. **Run the following command to authenticate and configure your environment:**
   ```bash
   gcloud init
   ```
3. Follow the prompts to log in to your Google Cloud account.
4.  Create a new project or select the project you want to use when prompted
5.  Enable the following API's
      ```bash
     gcloud services enable compute.googleapis.com iam.googleapis.com
     ``` 
6. Run to verify enabled API's
   ```bash
   gcloud services list --enabled
   ```



## Instructions for Running the Script

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MarkOB2003/gcp-vm-deployment.git
   cd gcp-vm-deployment
   ```
2. Be sure to change the PROJECT_ID in the script to the name of your PROJECT_ID if needed

   
**Git Bash for Linux commands**
1. In the Git Bash terminal, navigate to where you have saved the script and run this command to make the script excecutable:
   ```bash
   chmod +x deploy-vm.sh
   ```
   - Make sure "deploy-vm.sh" is the correct name of the script saved
     
2. **Execute the script using:**
   ```bash
   ./deploy-vm.sh
   ```
   - Again, make sure "deploy-vm.sh" is the correct name of the script saved


## Verify
 In the Google Cloud Console go to Compute Engine > VM instances in the left-hand menu
 - Check the VM status to make sure it is running
   
Back in SDK Console run:
   ```bash
   gcloud compute ssh my-vm-instance --zone=us-east1-b
   ```
Replace "my-vm-instance" and "us-central1-a" with your VM name and zone.


##HTTP Access into the VM
1. Inside the VM terminal install Apache:
   ```bash
   sudo apt update
   sudo apt install apache2
   ```
2. Create a Hello World Web Page
   ```bash
   echo "Hello World" | sudo tee /var/www/html/index.html
   ```
3. Access the "Hello World" webpage at http://<VM-EXTERNAL-IP>.


   

## Expected Output

1. **Script Execution**:
   - The script will output the following:
     ```
     VM instance created successfully!
     Instance Name: my-vm-instance
     Static IP: <VM-EXTERNAL-IP>
     Zone: us-central1-a
     ```

2. **VM Deployment**:
   - A VM instance with 2 vCPUs, 8GB RAM, and 250GB disk will be created.
   - A static IP address will be assigned to the VM.
   - Firewall rules will allow HTTP (port 80) and SSH (port 22) access.

3. **Webpage**:
   - A "Hello World" webpage will be hosted on the VM and accessible at `http://<VM-EXTERNAL-IP>`.

## Troubleshooting

1. **Python Not Found**:
   - Ensure Python is installed and added to your system's PATH.

2. **Permission Denied**:
   - Ensure your account has the necessary IAM roles (Compute Admin, Network Admin).

3. **Firewall Rules Not Applied**:
   - Manually create the firewall rule using:
     ```bash
     gcloud compute firewall-rules create allow-http-ssh --allow=tcp:80,tcp:22
     ```

4. **VM Not Accessible**:
   - Verify the VM is running in the Google Cloud Console.
   - Check the external IP address and ensure it is correct.

5. **Can't connect API Services**:
   - Make sure it is connected to a billable account.

