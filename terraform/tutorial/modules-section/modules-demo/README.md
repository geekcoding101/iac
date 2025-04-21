# Terraform Modules Demo — Meta-Arguments in Action

Welcome, infrastructure wrangler! 👋  
This demo project is a hands-on walkthrough of **Terraform meta-arguments** in the context of **modular infrastructure design**—a perfect reference if you’re trying to wrap your head around things like `count`, `for_each`, `provisioner`, `depends_on`, and `lifecycle`.

---

## 🔍 What This Is

This is a minimal but practical example of how to:
- Dynamically deploy **cloud-specific modules** (e.g., AWS or Azure) based on input variables
- Use `count` to conditionally include modules
- Leverage `null_resource` and `local-exec` for simple provisioning demos
- Structure a **wrapper module** to manage conditional logic cleanly
- Pass variables from root → wrapper → child modules with clarity

---

## 📁 Project Structure

```bash
modules-demo/
├── main.tf                # Root module: loads wrapper based on provider_type
├── variables.tf           # Input variable: provider_type
├── modules/
│   ├── aws_module/        # AWS-specific logic
│   │   └── main.tf
│   ├── azure_module/      # Azure-specific logic
│   │   └── main.tf
│   └── wrapper/           # Wrapper module that conditionally calls cloud modules
│       ├── main.tf
│       └── variables.tf
```

# 🚀 How to Use

1. Clone this repo or the subfolder:

```
git clone https://github.com/geekcoding101/iac.git
cd iac/terraform/tutorial/modules-section/modules-demo
```

2. Run Terraform with the desired cloud provider:

```
terraform init
terraform apply -var="provider_type=aws"
```

Or switch it up:

```
terraform apply -var="provider_type=azure"
```

You’ll see simple output via local-exec provisioners indicating which module ran.

# 📖 Read the Full Breakdown
Want the complete story behind this setup, including gotchas and pro tips?

👉 Read the full blog post [Terraform Meta-Arguments Unlocked: Practical Patterns for Clean Infrastructure Code](https://geekcoding101.com/devops/terraform/terraform-meta-arguments)