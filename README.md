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

## Instructions for Running the Script

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MarkOB2003/gcp-vm-deployment.git
   cd gcp-vm-deployment
   ```
   
2. **Make the script executable**:
    ```bash
   chmod +x deploy-vm.sh
   ```

3. **Run the script**:
    ```bash
   ./deploy-vm.sh
   ```

4. **Verify the deployment**:
    Check the Google Cloud Console to ensure the VM is running.
    Access the "Hello World" webpage at http://<VM-EXTERNAL-IP>.

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
   - Reconfigure `gcloud` to use the correct Python executable:
     ```bash
     gcloud config set core/python_executable $(which python)
     ```

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
