$srcShareName = "insert_share_name"
$destShareName = "insert_share_name"
$storageAccountName = "insert_storage_account_name"
$sasToken = "insert_sas_token"
$srcUrl = "https://$storageAccountName.file.core.windows.net/$srcShareName$sasToken"
$destUrl = "https://$storageAccountName.file.core.windows.net/$destShareName$sasToken"
$containerName = "acglab-azcopy"
$resourceGroupName = "insert_rg_name"
$location = (Get-AzResourceGroup -Name $resourceGroupName).Location
$command = "azcopy","copy","$srcUrl","$destUrl","--recursive"
$container = New-AzContainerInstanceObject -Name $containerName -Image peterdavehello/azcopy -Command $command
$containerGroup = New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerName -Location $location -Container $container -OsType Linux

