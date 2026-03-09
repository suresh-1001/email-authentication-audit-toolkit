# DMARC Audit Checklist

Domain-based Message Authentication, Reporting, and Conformance (DMARC) enforces SPF and DKIM authentication policies.

---

## Step 1 — Retrieve DMARC Record

Query the DMARC record using DNS.

Example:
dig TXT _dmarc.example.com


Expected format:
v=DMARC1; p=quarantine; rua=mailto:dmarc@example.com


---

## Step 2 — Validate Policy Settings

| Field | Description |
|------|-------------|
| v | DMARC version |
| p | Policy (none, quarantine, reject) |
| rua | Aggregate report address |
| ruf | Forensic report address |

---

## Step 3 — Verify Alignment

Check alignment between:

- SPF domain
- DKIM signing domain
- DMARC policy

---

## Step 4 — Monitor Reports

Review DMARC aggregate reports for:

- unauthorized senders
- authentication failures
- spoofing attempts

---

## Result

If DMARC policy is enforced and reporting is active, domain protection is functioning correctly.



