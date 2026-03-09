<#
.SYNOPSIS
Checks SPF, DKIM, and DMARC DNS records for a domain.

.DESCRIPTION
Performs DNS lookups to validate email authentication configuration.

.PARAMETER Domain
Domain to audit.

.EXAMPLE
.\ns-email-record-check.ps1 example.com
#>
