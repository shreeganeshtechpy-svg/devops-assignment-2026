# DevSecOps Assignment — GET 2026

A fully automated DevSecOps pipeline featuring a containerized Python web application, AWS infrastructure provisioning via Terraform, Jenkins CI/CD with Trivy security scanning, and AI-driven vulnerability remediation.

---

## 📐 Architecture

```
Developer (Local)
      │
      ▼
GitHub Repository
      │
      ▼
Jenkins Pipeline (Docker)
  ├── Stage 1: Checkout (git pull)
  ├── Stage 2: Trivy Scan (Terraform security check)
  └── Stage 3: Terraform Plan (infrastructure preview)
      │
      ▼
AWS (ap-south-1 — Mumbai)
  ├── VPC + Subnet + Internet Gateway
  ├── Security Group (port 80, 5000)
  └── EC2 t2.micro (Ubuntu 22.04)
        │
        └── Docker → Python Flask App (port 5000)
```

---

## ☁️ Cloud Provider
**Amazon Web Services (AWS)**
- Region: `ap-south-1` (Mumbai)
- EC2: `t2.micro` (Free Tier)
- OS: Ubuntu 22.04 LTS

---

## 🛠️ Tools & Technologies

| Category | Tool | Version |
|----------|------|---------|
| Language | Python | 3.11 |
| Framework | Flask | 3.0.0 |
| Container | Docker | Latest |
| Orchestration | Docker Compose | v3.8 |
| IaC | Terraform | 1.14.7 |
| CI/CD | Jenkins | LTS JDK17 |
| Security Scanner | Trivy | Latest |
| Cloud | AWS EC2 + VPC | - |

---

## 🚀 How to Run Locally

### 1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/devops-assignment-2026.git
cd devops-assignment-2026
```

### 2. Run with Docker Compose
```bash
docker-compose up --build
```

### 3. Open in browser
```
http://localhost:5000
```

### 4. Health check
```
http://localhost:5000/health
```

---

## 🔧 Jenkins Pipeline Setup

1. Open Jenkins at `http://localhost:8080`
2. New Item → Pipeline → OK
3. Pipeline → Definition: `Pipeline script from SCM`
4. SCM: Git → paste your GitHub repo URL
5. Script Path: `Jenkinsfile`
6. Save → Build Now

---

## 🔒 Security Remediation

### Before (Vulnerable)
```hcl
# SSH open to entire internet — CRITICAL vulnerability
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # ⚠️ INSECURE
}
```

### After (Fixed with AI)
```hcl
# SSH restricted to trusted IP only
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["YOUR_IP/32"]  # ✅ SECURE
}
```

---

## 🤖 AI Usage Log

### Prompt Used
```
Here is a Trivy security scan report from my Terraform infrastructure code:

[PASTE TRIVY REPORT HERE]

Please:
1. Explain each vulnerability found in simple terms
2. Rate the risk level and potential impact
3. Provide the fixed Terraform code for each issue
4. Explain why your fix improves security
```

### Identified Risks
| Issue | Severity | Description |
|-------|----------|-------------|
| SSH open to 0.0.0.0/0 | CRITICAL | Anyone on the internet can attempt SSH brute force |
| Unrestricted ingress | HIGH | Overly permissive firewall rules increase attack surface |

### AI Recommendations Applied
- Restricted SSH (port 22) to specific trusted IP CIDR instead of `0.0.0.0/0`
- Added principle of least privilege to security group rules
- Result: Zero critical issues in re-scan ✅

---

## 📸 Screenshots
- `screenshots/jenkins-fail.png` — Initial failing pipeline (Trivy detects CRITICAL)
- `screenshots/jenkins-pass.png` — Final passing pipeline (after AI fix)
- `screenshots/app-running.png` — Application live on AWS public IP

---

## 🌐 Live Application
**http://[EC2-PUBLIC-IP]:5000**

---

## 📁 Repository Structure
```
devops-assignment-2026/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── templates/index.html
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
└── README.md
```
