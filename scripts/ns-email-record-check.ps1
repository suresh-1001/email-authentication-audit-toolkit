<#
.SYNOPSIS
    Email Authentication DNS Audit Script

.DESCRIPTION
    This script checks DNS records related to email authentication
    including SPF, DKIM, and DMARC for a given domain.

.PARAMETER Domain
    The domain to audit.

.EXAMPLE
    .\ns-email-record-check.ps1 example.com
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$Domain
)

Write-Host ""
Write-Host "============================================"
Write-Host " Email Authentication DNS Audit"
Write-Host " Domain: $Domain"
Write-Host "============================================"
Write-Host ""

# ---------------------------------------------------
# SPF CHECK
# ---------------------------------------------------

Write-Host "Checking SPF Record..."
try {
    $spfRecords = Resolve-DnsName -Type TXT $Domain -ErrorAction Stop | Where-Object {$_.Strings -match "spf"}

    if ($spfRecords) {
        Write-Host "SPF Record Found:" -ForegroundColor Green
        $spfRecords.Strings
    } else {
        Write-Host "No SPF record detected." -ForegroundColor Yellow
    }
}
catch {
    Write-Host "Error retrieving SPF record." -ForegroundColor Red
}

Write-Host ""

# ---------------------------------------------------
# DMARC CHECK
# ---------------------------------------------------

Write-Host "Checking DMARC Record..."
try {
    $dmarc = Resolve-DnsName -Type TXT "_dmarc.$Domain" -ErrorAction Stop

    Write-Host "DMARC Record Found:" -ForegroundColor Green
    $dmarc.Strings
}
catch {
    Write-Host "No DMARC record detected." -ForegroundColor Yellow
}

Write-Host ""

# ---------------------------------------------------
# DKIM CHECK
# ---------------------------------------------------

Write-Host "Checking DKIM Selectors..."

$selectors = @(
    "selector1",
    "selector2",
    "default",
    "google"
)

foreach ($selector in $selectors) {
    $dkimRecord = "$selector._domainkey.$Domain"

    try {
        Resolve-DnsName -Type TXT $dkimRecord -ErrorAction Stop | Out-Null
        Write-Host "DKIM selector found: $selector" -ForegroundColor Green
    }
    catch {
        Write-Host "DKIM selector not found: $selector" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "DNS Authentication Audit Complete."
Write-Host ""
