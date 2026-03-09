# DMARC Setup Guide

Domain-based Message Authentication, Reporting, and Conformance (DMARC) defines how receiving mail systems should handle messages that fail SPF or DKIM checks.

---

## Purpose

| Item | Description |
|------|------|
| Control | DMARC |
| Purpose | Enforce domain authentication policy |
| Record Type | TXT |
| Published At | `_dmarc.example.com` |

---

## Example DMARC Record

| Field | Value |
|------|------|
| Host | `_dmarc.example.com` |
| Type | `TXT` |
| Value | `v=DMARC1; p=quarantine; rua=mailto:dmarc@example.com` |

---

## Setup Steps

| Step | Action |
|------|------|
| 1 | Decide on an initial policy (`none`, `quarantine`, or `reject`) |
| 2 | Configure reporting mailbox |
| 3 | Publish the DMARC TXT record in DNS |
| 4 | Validate DNS propagation |
| 5 | Monitor reports and strengthen enforcement over time |

---

## Recommended Deployment Phases

| Phase | Policy | Purpose |
|------|------|------|
| Phase 1 | `p=none` | Monitor only |
| Phase 2 | `p=quarantine` | Move suspicious mail to spam/quarantine |
| Phase 3 | `p=reject` | Reject unauthorized messages |

---

## Validation Command

| Tool | Command |
|------|------|
| dig | `dig TXT _dmarc.example.com` |
| PowerShell | `Resolve-DnsName -Type TXT _dmarc.example.com` |

---

## Common Problems

| Problem | Description |
|------|------|
| No reporting mailbox | No visibility into failures |
| Policy too weak | Domain remains vulnerable to spoofing |
| Misalignment | SPF/DKIM pass but DMARC fails |

---

## Recommended Result

| Check | Expected Outcome |
|------|------|
| DMARC record present | Yes |
| Reporting enabled | Yes |
| Authentication result | `dmarc=pass` |
