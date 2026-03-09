# Email Authentication Audit Scripts

This directory contains PowerShell scripts used to audit DNS-based email authentication configurations.

These scripts help security engineers and administrators quickly verify SPF, DKIM, and DMARC configurations.

---

## Available Scripts

| Script | Purpose |
|------|------|
| ns-email-record-check.ps1 | Checks SPF, DKIM, and DMARC DNS records |
| ses-identity-audit.ps1 | Verifies AWS SES domain identities |

---

## Requirements

These scripts require:

- PowerShell 5+
- Internet access for DNS queries
- AWS CLI installed (for SES script)

---

## Example Usage

| Task | Command |
|-----|--------|
| Check DNS authentication records | `.\ns-email-record-check.ps1 example.com` |
| Audit AWS SES identities | `.\ses-identity-audit.ps1` |


---

## Output

The scripts will display:

- SPF records
- DKIM selectors
- DMARC policy
- SES domain verification status

