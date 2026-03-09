# DKIM Audit Checklist

DomainKeys Identified Mail (DKIM) ensures that messages have not been modified in transit and verifies domain ownership.

---

## Step 1 — Identify DKIM Selectors

Check DNS for DKIM selectors.

Example:
dig TXT selector1._domainkey.example.com


Expected format:
v=DKIM1; k=rsa; p=publickey


---

## Step 2 — Validate DNS Configuration

| Check | Requirement |
|------|------|
| Selector exists | DNS record resolves correctly |
| Public key present | `p=` parameter populated |
| Record format valid | Contains DKIM version |

---

## Step 3 — Verify Email Headers

Send a test message and inspect headers.

Expected result:
dkim=pass


---

## Step 4 — Check Key Rotation

Confirm DKIM keys are rotated periodically to maintain security.

---

## Result

If DKIM signatures validate successfully, domain signing is correctly configured.

