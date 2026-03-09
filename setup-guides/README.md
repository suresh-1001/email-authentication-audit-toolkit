# Email Authentication Setup Guides

This directory contains step-by-step setup guides for configuring DNS-based email authentication controls.

These guides are intended for administrators and consultants responsible for implementing secure and reliable email delivery.

---

## Available Guides

| Guide | Purpose |
|------|------|
| SPF Setup Guide | Configure Sender Policy Framework records |
| DKIM Setup Guide | Configure DomainKeys Identified Mail signing |
| DMARC Setup Guide | Configure Domain-based Message Authentication, Reporting, and Conformance |

---

## Typical Deployment Order

| Step | Action |
|------|------|
| 1 | Configure SPF record |
| 2 | Enable DKIM signing and publish DNS records |
| 3 | Configure DMARC policy |
| 4 | Send test email and validate authentication results |
| 5 | Review DMARC reports and refine policy |

---

## Related Documentation

| Folder | Description |
|------|------|
| `checklists/` | Audit validation checklists |
| `scripts/` | PowerShell verification scripts |
| `reports/` | Sample audit deliverables |
| `aws-ses/` | Amazon SES runbooks |
| `diagrams/` | Architecture diagrams |
