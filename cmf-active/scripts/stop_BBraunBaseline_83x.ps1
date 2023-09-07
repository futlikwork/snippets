$services = Get-Service | Where-Object { $_.DisplayName -like "*BBraunBaseline_83x*" }

$services | ForEach-Object { Stop-Service $_.Name }