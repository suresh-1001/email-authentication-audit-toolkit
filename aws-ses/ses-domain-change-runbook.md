# AWS SES Domain Change Runbook

This runbook outlines the process for migrating email sending from one domain to another within Amazon Simple Email Service (SES).

The process ensures proper DNS authentication configuration and minimizes email deliverability issues during migration.

---

## Overview

Typical scenarios for domain migration include:

- Rebranding or domain changes
- Moving from a subdomain to a primary domain
- Migrating email infrastructure
- Improving deliverability isolation

---

## Step 1 — Create New Domain Identity

Log into the AWS Console and add the new sending domain.

| Action | Description |
|------|------|
| Service | Amazon SES |
| Section | Verified Identities |
| Action | Create Identity |
| Type | Domain |

Example domain:

| Field | Value |
|------|------|
| Domain | newdomain.com |

---

## Step 2 — Add Domain Verification DNS Record

SES generates a TXT record to verify ownership of the domain.

Example DNS record:

| Field | Value |
|------|------|
| Host | `_amazonses.newdomain.com` |
| Type | `TXT` |
| Value | `verificationtoken` |

Add this record to your DNS provider.

DNS propagation may take several minutes.

---

## Step 3 — Configure DKIM Signing

SES generates DKIM CNAME records.

Example records:

| Host | Type | Value |
|-----|-----|------|
| selector1._domainkey.newdomain.com | CNAME | AWS DKIM endpoint |
| selector2._domainkey.newdomain.com | CNAME | AWS DKIM endpoint |
| selector3._domainkey.newdomain.com | CNAME | AWS DKIM endpoint |

After adding these records, SES automatically validates DKIM.

---

## Step 4 — Update SPF Record

Update the SPF record for the new domain.

Example SPF record:

| Field | Value |
|------|------|
| Host | `newdomain.com` |
| Type | `TXT` |
| Value | `v=spf1 include:amazonses.com -all` |

This allows Amazon SES to send email on behalf of the domain.

---

## Step 5 — Update Sending Applications

Update all applications sending email to use the new domain.

Examples include:

- Web applications
- Marketing platforms
- SMTP integrations
- Backend notification services

Typical configuration changes:

| Setting | Example |
|------|------|
| From Address | alerts@newdomain.com |
| SMTP Server | email-smtp.us-east-1.amazonaws.com |
| Port | 587 |
| Authentication | SES SMTP credentials |

---

## Step 6 — Verify Authentication

Send test messages and verify authentication results in message headers.

Example header results:

| Authentication | Result |
|------|------|
| SPF | pass |
| DKIM | pass |
| DMARC | pass |

Example header output:

---

## Step 7 — Monitor Deliverability

After migration monitor:

- DMARC aggregate reports
- Bounce rates
- Complaint rates
- Sender reputation

Recommended tools:

- Google Postmaster Tools
- AWS SES Metrics
- MXToolbox

---

## Rollback Plan

If issues occur:

1. Revert sending applications to the previous domain
2. Verify DNS records for the new domain
3. Check SES identity verification status
4. Re-test email authentication

---

## Notes

Best practice is to migrate using a **subdomain first**, for example:

| Domain Type | Example |
|------|------|
| Primary domain | example.com |
| Sending subdomain | mail.example.com |

Using a sending subdomain helps isolate reputation and improves deliverability control.
