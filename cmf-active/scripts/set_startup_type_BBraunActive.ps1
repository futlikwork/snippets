$services = Get-Service | Where-Object { $_.DisplayName -like "*BBraunActive*" }

$services | ForEach-Object { Set-Service -Name $_.Name -StartupType Manual }