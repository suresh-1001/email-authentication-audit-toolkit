# DKIM Setup Guide

DomainKeys Identified Mail (DKIM) uses cryptographic signatures to verify that email has not been altered in transit and is authorized by the sending domain.

---

## Purpose

| Item | Description |
|------|------|
| Control | DKIM |
| Purpose | Verify message integrity and domain authorization |
| Record Type | TXT or CNAME depending on provider |
| Published At | Selector-based DNS record |

---

## Example DKIM Record

| Field | Value |
|------|------|
| Selector | `selector1` |
| Host | `selector1._domainkey.example.com` |
| Type | `TXT` |
| Value | `v=DKIM1; k=rsa; p=publickey` |

---

## Setup Steps

| Step | Action |
|------|------|
| 1 | Enable DKIM signing in the sending platform |
| 2 | Copy the selector DNS record provided by the mail service |
| 3 | Publish the DNS record |
| 4 | Verify DNS propagation |
| 5 | Send a test message and confirm `dkim=pass` |

---

## Validation Command

| Tool | Command |
|------|------|
| dig | `dig TXT selector1._domainkey.example.com` |
| PowerShell | `Resolve-DnsName -Type TXT selector1._domainkey.example.com` |

---

## Common Problems

| Problem | Description |
|------|------|
| Missing selector | DKIM validation fails |
| Invalid public key | Message signature cannot be verified |
| DNS propagation delay | DKIM may fail until DNS updates complete |

---

## Recommended Result

| Check | Expected Outcome |
|------|------|
| DKIM selector published | Yes |
| Public key available | Yes |
| Authentication result | `dkim=pass` |
