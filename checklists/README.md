# Email Authentication Audit Checklists

This directory contains structured audit checklists used to validate DNS-based email authentication configurations.

These checklists help identify misconfigurations that can affect email deliverability or allow domain spoofing.

---

## Available Checklists

| Checklist | Purpose |
|----------|--------|
| SPF Audit Checklist | Validate Sender Policy Framework configuration |
| DKIM Audit Checklist | Verify DomainKeys Identified Mail signing setup |
| DMARC Audit Checklist | Confirm DMARC policy enforcement and reporting |

---

## Typical Audit Workflow

When performing an email authentication audit, the following sequence is recommended:

1. Review the SPF record and authorized senders
2. Verify DKIM selectors and signing status
3. Validate the DMARC policy and reporting configuration
4. Confirm alignment between SPF, DKIM, and DMARC
5. Test authentication results using real email headers

---

## Tools Commonly Used

The following tools are commonly used during authentication audits:

- dig
- nslookup
- MXToolbox
- AWS CLI
- Google Postmaster Tools

---

## Related Documentation

Additional resources in this repository:

- `setup-guides/` – configuration guides
- `scripts/` – PowerShell validation scripts
- `reports/` – example audit reports
- `aws-ses/` – Amazon SES runbooks
