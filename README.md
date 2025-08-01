# CST8918 - DevOps: Infrastructure as Code
## Lab 12: Terraform CI/CD on Azure with GitHub Actions
### Team Members
- **Ololade Akinrinsola** | [@lolaakin](https://github.com/lolaakin) | akin0098@algonquinlive.com
- **Jonathan Martins** | [@dejalltime](https://github.com/dejalltime) | mart1449@algonquinlive.com
- **Iman Elsakaan** | [@ImanelSakaan](https://github.com/ImanelSakaan) | elsa0105@algonquinlive.com



# CST8918 – Lab: CI/CD with GitHub Actions for Terraform AKS Cluster Deployment

This lab demonstrates the use of **Infrastructure as Code (IaC)** with **Terraform**, integrating **GitHub Actions** to automate provisioning of an **AKS (Azure Kubernetes Service)** cluster. It also includes enforcing code quality using pre-commit hooks (Husky) and pull request workflows.

---

## ✅ Lab Objectives

- Provision an AKS cluster using Terraform  
- Automate infrastructure provisioning using GitHub Actions  
- Use PR-based CI workflows for `terraform plan` and `terraform apply`  
- Enforce IaC linting and formatting standards via pre-commit  
- Follow secure GitOps practices  

---

## 🤩 Challenges Encountered & Resolutions

1. **❌ `terraform apply` didn’t detect changes**  
   - **Cause:** Incorrect `tfplan` file path in GitHub Actions `terraform apply` step  
   - **Resolution:** Corrected the plan output path to `plan.tfplan`

2. **❌ `terraform apply` was skipped due to no changes**  
   - **Cause:** Plan already showed no infrastructure changes after path fix  
   - **Resolution:** Added test resources (e.g., VNet) to force a change and re-trigger workflow  

3. **❌ Resources not created but Terraform thought they were**  
   - **Cause:** Plan was generated but never applied due to earlier path issue  
   - **Resolution:** Deleted stale `.tfplan` file locally and re-ran plan  

4. **❌ 403 Forbidden Error during resource creation**  
   - **Cause:** GitHub Actions Service Principal lacked permissions (e.g., `Microsoft.Network/virtualNetworks/read`)  
   - **Resolution:** Used a resource group where the SP had **Contributor** role  

---

## 📷 Screenshots

✅ **Pull Request – Terraform Plan Success**  
![Terraform Plan Success](./screenshots/terraform-plan-success.png)

✅ **Pull Request – GitHub Actions Apply Success**  
![Terraform Apply Success](./screenshots/terraform-apply-success.png)

---

## 🔧 Tech Stack

- **Terraform** for Infrastructure as Code  
- **GitHub Actions** for CI/CD workflows  
- **Azure CLI** for identity and role management  
- **Husky** + **Pre-commit** for enforcing code standards  

---

## 📁 Folder Structure

```

.
├── .github
│   └── workflows
│       ├── infra-ci-cd.yml
│       ├── infra-drift-detection.yml
│       └── infra-static-tests.yml
├── infra/
│   └── (modularized infra resources)
├── README.md
└── screenshots/
├── terraform-plan-success.png
└── terraform-apply-success.png

````

---

## 🛉 Clean-Up

After testing, all resources were destroyed using:

```bash
terraform destroy
````

```

Let me know if you want me to turn this into a downloadable file or add GitHub badge integrations (like CI status).
```
