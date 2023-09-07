$services = Get-Service | Where-Object { $_.DisplayName -like "*ACTIVE_v1*" }

$services | ForEach-Object { Start-Service $_.Name }