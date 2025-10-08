
# PSO Practice Lab Pre-Requisite

This lab session will guide you through setting up cloud accounts (Azure and AWS), configuring required services, and using Git to clone a provided repository for CI/CD demonstrations.  
Before the lab, ensure you meet the following requirements.

---

## 1. Git & GitHub
- You will need Git installed on your local machine.
- A GitHub account to access the repository provided during the lab.
- Basic familiarity with Git commands (clone, pull, commit, push).

---

## 2. Credit/Debit Card (Minimum 1 per group)
- **Required for creating cloud accounts** on Azure, AWS, and Oracle.
- Prepaid cards may not work; ensure you have a valid card with online transactions enabled.
- You will not be charged if you stay within the free-tier limits.

---

## 3. Laptop & Internet Connection
- A personal laptop with:
  - Minimum **8 GB RAM** (recommended: 16 GB).
  - At least **10 GB free disk space**.
  - Stable internet connection (5 Mbps or higher recommended).
- Ability to install required tools and software.

---

## 4. Web Browser
- Use a modern browser (Google Chrome, Microsoft Edge, or Firefox).
- Ensure pop-ups are allowed for cloud provider login and verification pages.

---

## 5. Installed Tools

Before the session, install the following:

- **Git** ([Download Git](https://git-scm.com/downloads))
- **Visual Studio Code** ([Download VS Code](https://code.visualstudio.com/))
- **AWS CLI** ([Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
- **Azure CLI** ([Install Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli))
- **Terraform** ([Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- **Node.js** ([Download Node.js](https://nodejs.org/en/download))
- **Docker** ([Install Docker](https://docs.docker.com/get-docker/)) -- Optional, but recommended for containerization tasks.

Tools used by week:
- **Week 9**: Git, GitHub, VS Code, Node.js
- **Week 10**: Git, GitHub, VS Code, AWS CLI, Terraform, Node.js
- **Week 11**: Git, GitHub, VS Code, Azure CLI, Terraform, Node.js

VS Code Extensions (Helpful but optional):
- **Prettier**: Code formatter for consistent style.
- **HashiCorp Terraform**: Syntax highlighting and other features for Terraform files.
- **ESLint**: Linting for JavaScript/TypeScript.

VS Code can be replaced with any IDE or text editor of your choice. But you will need to find alternatives for the extensions mentioned above and adapt with the lab module that is not written for other IDE.

---

## Git & GitHub Setup

1. **Install Git**
   - Windows: Download from [git-scm.com](https://git-scm.com/download/win) and follow installation steps.
   - macOS: Install via [Homebrew](https://brew.sh/)  
     ```bash
     brew install git
     ```
   - Linux (Debian/Ubuntu):  
     ```bash
     sudo apt update && sudo apt install git -y
     ```

2. **Verify Installation**
   ```bash
   git --version
   ```

3. **Create a GitHub Account**
   - Go to [github.com](https://github.com) and sign up.
   - Verify your email.

4. **Configure Git**
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

5. **Generate SSH Key (Optional but Recommended)**
   ```bash
   ssh-keygen -t ed25519 -C "your.email@example.com"
   ```
   - Add the public key to GitHub:  
     [GitHub SSH Key Setup Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

6. **Using a Classic GitHub Personal Access Token**
   - Go to **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)** → **Generate new token**.
   - Give it a **descriptive name** (e.g., `Lab Token`).
   - Select **repo** and any other required permissions.
   - Set an expiration date (recommended: 30–90 days).
   - Copy the generated token and store it securely — **you will not be able to see it again**.

7. **Store GitHub Token for HTTPS Access**
   - Run the following command to cache your credentials:
     ```bash
     git config --global credential.helper store
     ```
   - The first time you push or pull, Git will ask for your GitHub username and **the personal access token** (instead of a password).
   - These credentials will be stored in `~/.git-credentials` for future use.

8. **Clone the Lab Repository**
   - You will be provided with the repository link during the lab:
     ```bash
     git clone <repository-url>
     ```

---
## Cloud Account Creation
During the lab, we will:
- Create **Azure** and **AWS** accounts.
- Enable required services for CI/CD pipelines.

**Important:**  
Bring your credit/debit card for account verification.
One card per group is sufficient if accounts are shared.
