$services = Get-Service | Where-Object { $_.DisplayName -like "*BBraunActive*" }

$services | ForEach-Object { Stop-Service $_.Name }