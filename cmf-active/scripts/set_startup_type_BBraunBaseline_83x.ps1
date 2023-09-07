$services = Get-Service | Where-Object { $_.DisplayName -like "*BBraunBaseline_83x*" }

$services | ForEach-Object { Set-Service -Name $_.Name -StartupType Manual }