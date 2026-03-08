# AWS SES Domain Verification

Amazon Simple Email Service (SES) requires domain ownership verification before email can be sent using that domain.

This document outlines the process for verifying a domain and enabling DKIM signing.

---

## Step 1 — Add Domain Identity

1. Log in to **AWS Console**
2. Navigate to **Amazon SES**
3. Click **Verified Identities**
4. Click **Create Identity**
5. Choose **Domain**

Example domain:

| Field | Value |
|------|------|
| Domain | example.com |

---

## Step 2 — Add DNS Verification Record

SES generates a TXT record to verify domain ownership.

Example DNS record:

| Field | Value |
|------|------|
| Host | `_amazonses.example.com` |
| Type | `TXT` |
| Value | `randomverificationtoken` |

Add this record to your DNS provider and wait for DNS propagation.

---

## Step 3 — Enable DKIM Signing

SES provides DKIM CNAME records to enable cryptographic email signing.

Example DKIM records:

| Host | Type | Value |
|-----|-----|------|
| selector1._domainkey.example.com | CNAME | AWS DKIM endpoint |
| selector2._domainkey.example.com | CNAME | AWS DKIM endpoint |
| selector3._domainkey.example.com | CNAME | AWS DKIM endpoint |

Each record will point to an AWS SES DKIM domain.

After adding these records, SES will automatically verify DKIM.

---

## Step 4 — Verify Status

You can verify domain status using the AWS CLI.

Example command:
aws ses get-identity-verification-attributes --identities example.com

Expected result:

| Field | Expected Value |
|------|------|
| VerificationStatus | Success |

---

## Step 5 — Test Email Authentication

Send a test email using the verified domain and inspect the message headers.

Example authentication results:

| Check | Result |
|------|------|
| SPF | pass |
| DKIM | pass |
| DMARC | pass |

Successful authentication confirms:

- SPF authorization succeeded
- DKIM signature validation succeeded
- DMARC alignment passed

---

## Notes

DNS propagation may take several minutes depending on your DNS provider.

If verification does not complete, confirm:

- TXT record is correctly published
- DKIM CNAME records are valid
- DNS changes have propagated globally
