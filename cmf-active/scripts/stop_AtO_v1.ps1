$services = Get-Service | Where-Object { $_.DisplayName -like "*AtO_v1*" }

$services | ForEach-Object { Stop-Service $_.Name }