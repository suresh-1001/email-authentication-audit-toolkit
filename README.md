# Email Authentication Audit Toolkit

Toolkit for auditing and configuring DNS-based email authentication (SPF, DKIM, DMARC) including AWS SES environments.

**SPF | DKIM | DMARC | AWS SES | Email Deliverability**

This repository provides tools, documentation, and audit checklists used to evaluate and configure email authentication infrastructure.

It is designed for systems administrators, security engineers, and consultants responsible for DNS email authentication and deliverability.

---

## Email Authentication Flow

![Email Authentication Flow](diagrams/email-authentication-flow.png)

---
## Features

- SPF, DKIM, and DMARC audit checklists
- PowerShell scripts to validate DNS authentication records
- AWS SES verification and migration runbooks
- Sample email authentication audit report
- Architecture diagrams explaining authentication flow
---
## What This Toolkit Covers

Modern email systems require multiple authentication layers to prevent spoofing and improve inbox placement.

This toolkit supports validation and configuration of:

- SPF (Sender Policy Framework)
- DKIM (DomainKeys Identified Mail)
- DMARC policy enforcement
- AWS SES domain authentication
- DNS email record validation
- Deliverability troubleshooting

---

## Typical Consulting Use Cases

This toolkit can be used for:

- Auditing existing DNS email authentication records
- Troubleshooting email deliverability problems
- Verifying AWS SES domain configuration
- Implementing DMARC enforcement policies
- Validating DKIM signing after migrations

---

## Quick Start

Run the DNS audit script.

| Action | Command |
|------|------|
| Audit DNS email authentication | `.\scripts\ns-email-record-check.ps1 example.com` |
| Audit AWS SES identities | `.\scripts\ses-identity-audit.ps1` |

Example output:

| Check | Result |
|------|------|
| SPF | pass |
| DKIM | pass |
| DMARC | pass |

---

## Repository Structure

| Directory | Description |
|----------|-------------|
| `checklists/` | Audit validation checklists for SPF, DKIM, and DMARC |
| `setup-guides/` | Step-by-step configuration guides |
| `aws-ses/` | Amazon SES verification and migration runbooks |
| `scripts/` | PowerShell DNS and SES audit scripts |
| `reports/` | Example email authentication audit reports |
| `diagrams/` | Architecture diagrams used in documentation |

---

### Example Domain Audit

Example DNS checks performed during an audit:

```bash
dig TXT example.com
dig TXT _dmarc.example.com
dig TXT selector1._domainkey.example.com
```

### Authentication Results

| Check | Result |
|------|------|
| SPF | pass |
| DKIM | pass |
| DMARC | pass |

### Interpretation

| Check | Outcome |
|------|---------|
| SPF | Authorization succeeded |
| DKIM | Signature validation succeeded |
| DMARC | Alignment passed |

---

### Example Audit Scenario

Example domain audit workflow:

1. Retrieve SPF record and verify authorized senders  
2. Validate DKIM selectors and DNS records  
3. Inspect DMARC policy and reporting configuration  
4. Check AWS SES domain verification status  
5. Test message headers for authentication results  
6. Generate remediation recommendations
