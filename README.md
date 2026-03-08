# Email Authentication Audit Toolkit

SPF | DKIM | DMARC | AWS SES | Email Deliverability

This repository provides tools, documentation, and audit checklists used to evaluate and configure email authentication infrastructure.

It is designed for systems administrators, security engineers, and consultants responsible for DNS email authentication and deliverability.

---

# What This Toolkit Covers

Modern email systems require multiple authentication layers to prevent spoofing and improve inbox placement.

This toolkit supports validation and configuration of:

• SPF (Sender Policy Framework)  
• DKIM (DomainKeys Identified Mail)  
• DMARC policy enforcement  
• AWS SES domain authentication  
• DNS email record validation  
• deliverability troubleshooting  

---

# Typical Consulting Use Cases

This toolkit can be used for:

• auditing existing DNS email authentication records  
• troubleshooting email deliverability problems  
• verifying AWS SES domain configuration  
• implementing DMARC enforcement policies  
• validating DKIM signing after migrations  

---

# Repository Structure

checklists  
Audit checklists for SPF, DKIM, and DMARC configuration.

setup-guides  
Step-by-step setup documentation.

aws-ses  
Amazon SES domain verification and migration runbooks.

scripts  
PowerShell scripts for DNS inspection and SES audits.

reports  
Example email authentication audit reports.

---

# Quick Start

Run a basic DNS authentication audit using the included PowerShell script.

PowerShell:


scripts/dns-email-record-check.ps1


Example:


.\dns-email-record-check.ps1 example.com


This script checks:

• SPF record  
• DKIM selectors  
• DMARC policy  

This provides a quick snapshot of the domain's email authentication configuration.

---

# Example Domain Audit

Example checks performed during an audit:

dig TXT example.com

dig TXT _dmarc.example.com

dig TXT selector1._domainkey.example.com

Validate message headers:

Authentication-Results:

spf=pass
dkim=pass
dmarc=pass


This confirms that:

• SPF authorization succeeded  
• DKIM signature validation succeeded  
• DMARC alignment passed  

---

# Tools Commonly Used

During authentication audits the following tools are often used:

dig  
nslookup  
MXToolbox  
AWS CLI  
OpenSSL  
Google Postmaster Tools  

---

# Example Audit Scenario

Example domain audit workflow:

1. Retrieve SPF record and verify authorized senders  
2. Validate DKIM selectors and DNS records  
3. Inspect DMARC policy and reporting configuration  
4. Check AWS SES domain verification status  
5. Test message headers for authentication results  
6. Generate remediation recommendations  

---

# License

MIT License
