
# How to update template

1. restore to ORIGINAL
    using the pipeline for restore: Pipelines - Runs for Active-Environment-BackupRestore (criticalmanufacturing.com)

2. install template v 2.1.8
    you can run a script on the vm, or use the MES Setup:
    here is the script that I used for 2.1.7

`.\tools\CmfDeploy.exe install --packageToInstall=Cmf.Custom.Baseline.Package@2.1.8 --parameters=\\vm-bbraun2\Deployments\Active-ReleaseCandidates\Configurations\EnvironmentConfigs\ACTIVE_v1.json --packageSources="E:\","\\vm-bbraun2.cmf.criticalmanufacturing.com\Deployments\Baseline-Delivered_v2" -logFileLocation "\\vm-bbraun2.cmf.criticalmanufacturing.com\Deployments\Active-ReleaseCandidates`

3. create a new ORIGINAL backup
    again using the pipeline for backup: Pipelines - Runs for Active-Environment-BackupRestore (criticalmanufacturing.com)