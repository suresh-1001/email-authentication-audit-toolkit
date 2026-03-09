# SPF Setup Guide

Sender Policy Framework (SPF) is used to define which mail servers are authorized to send email on behalf of a domain.

---

## Purpose

| Item | Description |
|------|------|
| Control | SPF |
| Purpose | Authorize sending mail servers |
| Record Type | TXT |
| Published At | Root domain |

---

## Example SPF Record

| Field | Value |
|------|------|
| Host | `example.com` |
| Type | `TXT` |
| Value | `v=spf1 include:_spf.google.com include:amazonses.com ~all` |

---

## Setup Steps

| Step | Action |
|------|------|
| 1 | Identify all legitimate mail sending services |
| 2 | Build the SPF record using authorized include statements or IP ranges |
| 3 | Publish the SPF record as a TXT record in DNS |
| 4 | Verify the record using DNS lookup tools |
| 5 | Send a test email and confirm `spf=pass` in message headers |

---

## Validation Command

| Tool | Command |
|------|------|
| dig | `dig TXT example.com` |
| PowerShell | `Resolve-DnsName -Type TXT example.com` |

---

## Common Problems

| Problem | Description |
|------|------|
| Multiple SPF records | Causes SPF evaluation failures |
| Too many lookups | SPF supports a maximum of 10 DNS lookups |
| Missing senders | Legitimate mail sources may fail SPF |

---

## Recommended Result

| Check | Expected Outcome |
|------|------|
| SPF record present | Yes |
| SPF syntax valid | Yes |
| Authentication result | `spf=pass` |
