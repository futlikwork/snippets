Clear-Host

Write-Output "Union json files"


$pathToMasterData = 'C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Features\Cmf.Custom.ACTIVE\Cmf.Custom.ACTIVE.IoT\IoTData\MasterData\ToPack'
$resultFileName = 'output/result.masterdata.json'

$vfInConfigFile = 'config.empty.json'
$vfOutConfigFile = 'output/result.config.json'


$files = Get-ChildItem -Path $pathToMasterData -File | Sort-Object -Property Name | Select-Object FullName

Write-Host $files


$listsNames = @(
    '<DM>AutomationDriverDefinition',
    'AutomationProperty',
    'AutomationEvent',
    'AutomationEventProperties',
    'AutomationCommand',
    'AutomationCommandParameter'
)

$lists = [ordered]@{}


foreach($listName in $listsNames) {
    $lists."$listName" = New-Object System.Collections.ArrayList
}


foreach($fn in $files) {
    $f = Get-Content -Raw $fn.FullName | ConvertFrom-Json
    foreach($listName in $listsNames) {
        $i = 1
         while ($f.$listName.$i) {
            $v = $f.$listName.$i
            $lists.$listName.Add($v)
            $i++
        }
    }
}


# get only first two AutomationDriverDefinition

$lists.'<DM>AutomationDriverDefinition' = @( $lists.'<DM>AutomationDriverDefinition'[0], $lists.'<DM>AutomationDriverDefinition'[1])

$result = [ordered]@{
    '<DM>AutomationDriverDefinition' = [ordered]@{}
    'AutomationProperty' = [ordered]@{}
    'AutomationEvent' = [ordered]@{}
    'AutomationEventProperties' = [ordered]@{}
    'AutomationCommand' = [ordered]@{}
    'AutomationCommandParameter' = [ordered]@{}
}


foreach($listName in $listsNames) {
    for ($i = 0; $i -lt $lists.$listName.Count; $i++) {
        $result.$listName."$($i+1)" = $lists.$listName[$i]
    }
}

$resultStr = $result | ConvertTo-Json -depth 100

$resultStr | Out-File $resultFileName

(Get-Content $vfInConfigFile) -replace """MASTER-DATA""" , $resultStr | Set-Content -Path $vfOutConfigFile