cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\LocalEnvironment\MessageBusGateway
.\Cmf.MessageBus.Gateway.exe

docker ps -a
docker start ACTIVE_v1-DB

cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Features\Cmf.Custom.ACTIVE\Cmf.Custom.ACTIVE.Business
cmf build
dotnet build

cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Libs\LBOs
.\generateLBOs.ps1

cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Cmf.Custom.Tests
cmf build
dotnet build


cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Features\Cmf.Custom.ACTIVE\Cmf.Custom.ACTIVE.HTML
cmf build
node --max_old_space_size=8048 ./node_modules/@angular/cli/bin/ng serve


cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022\Features\Cmf.Custom.ACTIVE\Cmf.Custom.ACTIVE.Help
cmf build


== Update Env

git clone ssh://tfs-projects.cmf.criticalmanufacturing.com/ImplementationProjects/BBRAUNATO/_git/BBRAUNACTIVE2022

cd C:\Work\BBRAUNATO\BBRAUNACTIVE2022
cmf-dev local db --license "B. Braun Template_Critical Manufacturing_Development_v10.0.0_ED20231004" --isoPath "C:\Work\Critical Manufacturing 10.1.0.iso"

cmf-dev local env --isoPath "C:\Work\Critical Manufacturing 10.1.0.iso"