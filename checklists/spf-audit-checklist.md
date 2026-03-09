# SPF Audit Checklist

Sender Policy Framework (SPF) verifies that sending mail servers are authorized to send email on behalf of a domain.

---

## Step 1 — Retrieve SPF Record

Use DNS tools to retrieve the SPF record.

Example:
dig TXT example.com


Expected output example:
v=spf1 include:_spf.google.com include:amazonses.com ~all


---

## Step 2 — Validate Record Structure

| Check | Requirement |
|-----|-----|
| SPF Version | Must start with `v=spf1` |
| Authorized Senders | Includes all legitimate mail providers |
| Lookup Count | Must not exceed 10 DNS lookups |
| Policy | Ends with `~all` or `-all` |

---

## Step 3 — Identify Common Issues

Common SPF problems include:

- Multiple SPF records
- Missing sending services
- Excessive DNS lookups
- Incorrect include mechanisms

---

## Step 4 — Test with Real Email

Send a test email and inspect headers.

Example:
spf=pass


---

## Result

If SPF passes and lookup limits are respected, the configuration is valid.

