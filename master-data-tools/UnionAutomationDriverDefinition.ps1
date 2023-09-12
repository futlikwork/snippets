Clear-Host
 
Write-Output "Union json files"

 
$files = @(
    'input/InitialDriverDefinition.json'
    ,'output/GVL_ConsumptionLocation_Batchlabel_Dispenserbox.dd.json'
    ,'output/GVL_ConsumptionLocation_Batchlabel_Shippingbox.dd.json'
    ,'output/GVL_ConsumptionLocation_Heissleim.dd.json'
    ,'output/GVL_ConsumptionLocation_IFU.dd.json'
    ,'output/GVL_ConsumptionLocation_Language_Label.dd.json'
    ,'output/GVL_ConsumptionLocation_Magazin_DispenserBox.dd.json'
    ,'output/GVL_ConsumptionLocation_Magazin_ShippingBox.dd.json'
    ,'output/GVL_ConsumptionLocation_SteriIndicator.dd.json'
    ,'output/GVL_ConsumptionLocation_Thermotransferband_Dispenserbox.dd.json'
    ,'output/GVL_ConsumptionLocation_ThermoTransferRibbon_Shippingbox.dd.json'
    ,'output/GVL_ConsumptionLocation_WaterWetTape.dd.json'
    ,'output/GVL_ConsumptionLocation_WetTape.dd.json'
    ,'output/GVL_GetCurrentRecipe.dd.json'
    ,'output/GVL_ReleaseProduction.dd.json'
)
 
$resultFileName = 'output/RESULT.dd.json'
 
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
    $f = Get-Content -Raw $fn | ConvertFrom-Json
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
 
$result | ConvertTo-Json -depth 100 | Out-File $resultFileName