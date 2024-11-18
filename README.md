# Terraform Project: WordPress Deployment

## Project Overview

This is a comprehensive Terraform project developed independently without utilizing external Terraform modules. This hands-on approach has allowed for an in-depth understanding of Terraform, including manual management of outputs, variables, and dependencies. While the journey was challenging, the final product is fully functional and meets all project requirements.

## Real-World Considerations

In real-world scenarios, leveraging Terraform registry modules is often recommended due to their reliability and adherence to best practices. However, this project has provided a deep exploration of Terraform's fundamentals, emphasizing the significance of pre-built modules and the intricacies involved in infrastructure management.

## Implementation Details

- **Database Password Management**: The database password is securely stored in a local `terraform.tfvars` file, integrated into the deployment process via the Terraform CLI. This ensures sensitive information is managed securely.

- **Webserver Installation**: The `install-wordpress.sh` script is designed for Amazon Linux 2023, effectively utilizing Terraform variables. This script has been thoroughly tested and is functioning as intended.

## Project Status

- **Load Balancer**: Fully accessible and operational, managing incoming traffic efficiently.

- **Target Groups**: Healthy target groups that accurately route traffic to instances within the Auto Scaling Group.

- **Bastion Host**: Successfully connects to private subnet EC2 instances where WordPress is hosted.

- **Instances & Database**: All components, including EC2 instances and the database, are operating smoothly, providing a stable environment for the application.

## Conclusion

Thank you for reviewing my exam. This project has been a valuable learning experience, enhancing my understanding of Terraform. I am confident that the skills acquired will be beneficial in real-world applications, and I look forward to applying them in future endeavors.

## Getting Started

To deploy this project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/sshsurabhi/terraform-project-final.git

   cd terraform-project-final
   terraform init
   terraform apply
   
![ScreenShot](C:\Users\surab\Downloads\Terraform-AWS-Project\Images-Implemented\terraform-1.png)
### Notes:
- Make sure to adjust the "Getting Started" section to include any specific commands or requirements needed for your project.
- If you have additional features, dependencies, or instructions, feel free to expand this `README.md` accordingly.
- Be sure to include any necessary files, such as the `install-wordpress.sh` script and any licensing files, in your repository.