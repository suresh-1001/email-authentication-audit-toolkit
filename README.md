# Email Authentication Audit Toolkit

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)
![AWS SES](https://img.shields.io/badge/AWS-SES-orange?logo=amazonaws)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

Toolkit for auditing and configuring DNS-based email authentication (SPF, DKIM, DMARC) including AWS SES environments.

> Designed for systems administrators, security engineers, and consultants responsible for DNS email authentication and deliverability.

---

## Email Authentication Flow

![Email Authentication Flow](diagrams/email-authentication-flow.png)

---

## Features

- ✅ SPF, DKIM, and DMARC audit checklists
- ✅ PowerShell scripts to validate DNS authentication records
- ✅ AWS SES verification and migration runbooks
- ✅ Sample email authentication audit report
- ✅ Architecture diagrams explaining authentication flow

---

## Prerequisites

Before running the scripts, ensure you have:

| Requirement | Details |
|---|---|
| PowerShell | Version 5.1 or later (Windows) or PowerShell 7+ (cross-platform) |
| AWS CLI | Configured with a profile that has SES read permissions |
| IAM Permissions | `ses:ListIdentities`, `ses:GetIdentityVerificationAttributes`, `ses:GetIdentityDkimAttributes` |
| DNS Access | Ability to query public DNS (no special permissions needed) |

---

## Quick Start

**1. Audit DNS email authentication records for a domain:**

```powershell
.\scripts\ns-email-record-check.ps1 -Domain example.com
```

**Example output:**

```
[+] Checking example.com...

SPF Record   : v=spf1 include:amazonses.com ~all
SPF Result   : PASS

DKIM Selector: selector1._domainkey.example.com
DKIM Result  : PASS

DMARC Record : v=DMARC1; p=reject; rua=mailto:dmarc@example.com
DMARC Result : PASS

[+] All authentication checks passed.
```

**2. Audit AWS SES domain identities:**

```powershell
.\scripts\ses-identity-audit.ps1 -Profile default -Region us-east-1
```

---

## Repository Structure

| Directory | Description |
|---|---|
| `checklists/` | Audit validation checklists for SPF, DKIM, and DMARC |
| `setup-guides/` | Step-by-step configuration guides for each protocol |
| `aws-ses/` | Amazon SES verification and migration runbooks |
| `scripts/` | PowerShell DNS and SES audit scripts |
| `reports/` | Sample email authentication audit report |
| `diagrams/` | Architecture diagrams used in documentation |

---

## What This Toolkit Covers

Modern email systems require multiple authentication layers to prevent spoofing and improve inbox placement. This toolkit supports validation and configuration of:

- **SPF** — Sender Policy Framework record validation
- **DKIM** — DomainKeys Identified Mail selector and signature checks
- **DMARC** — Policy enforcement and reporting configuration
- **AWS SES** — Domain authentication and identity verification
- **Deliverability** — DNS record troubleshooting and remediation guidance

---

## Typical Consulting Use Cases

| Scenario | Tools Used |
|---|---|
| Auditing existing DNS email authentication records | `ns-email-record-check.ps1` + checklists |
| Troubleshooting email deliverability problems | scripts + setup-guides |
| Verifying AWS SES domain configuration | `ses-identity-audit.ps1` + aws-ses runbooks |
| Implementing DMARC enforcement policies | `dmarc-setup-guide.md` + `dmarc-audit-checklist.md` |
| Validating DKIM signing after migrations | `dkim-audit-checklist.md` + `ses-domain-change-runbook.md` |

---

## Example Domain Audit Workflow

A typical end-to-end audit looks like this:

1. Retrieve SPF record and verify all authorized sending sources
2. Validate DKIM selectors and confirm DNS records are propagated
3. Inspect DMARC policy mode (`none` / `quarantine` / `reject`) and reporting addresses
4. Check AWS SES domain verification and DKIM signing status
5. Test live message headers for authentication pass/fail results
6. Generate remediation recommendations using the sample report template

---

## License

[MIT](LICENSE) — free to use, adapt, and share for commercial and non-commercial purposes.

---

## Author

**Suresh Chand** — Director of IT | Enterprise Infrastructure & Security Engineer  
📧 [suresh@echand.com](mailto:suresh@echand.com) &nbsp;|&nbsp; 💼 [LinkedIn](https://linkedin.com/in/sureshchand01) &nbsp;|&nbsp; 🐙 [GitHub](https://github.com/suresh-1001)
