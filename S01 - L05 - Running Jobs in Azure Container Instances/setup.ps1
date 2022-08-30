# Setup the demo environment

curl https://raw.githubusercontent.com/ACloudGuru-Resources/content-automating-lifecycle-management-azure-file-shares/main/S01%20-%20L05%20-%20Running%20Jobs%20in%20Azure%20Container%20Instances/azuredeploy.json -o azuredeploy.json

az deployment group create `
--resource-group (az group list --query '[].name' --output tsv) `
--template-file azuredeploy.json

