$srcShareName = "srcshare"
$destShareName = "destshare"
$storageAccountName = (Get-AzStorageAccount).StorageAccountName # Replace with your storage account name - PowerShell Cmdlet may not work outside of ACG/PS environments
$sasToken = "?sv=2021-06-08&ss=f&srt=sco&sp=rwdlc&se=2022-08-30T20:28:24Z&st=2022-08-30T12:28:24Z&spr=https&sig=Mf0eN7I%2BxjiF431%2FkCzz1D3F4KCjj7OK82%2Fbwi44e0s%3D"
$srcUrl = "https://$storageAccountName.file.core.windows.net/$srcShareName$sasToken"
$destUrl = "https://$storageAccountName.file.core.windows.net/$destShareName$sasToken"
$containerName = "acglab-azcopy"
$resourceGroupName = (Get-AzResourceGroup).ResourceGroupName
$location = (Get-AzResourceGroup).Location
$command = "azcopy","copy","$srcUrl","$destUrl","--recursive"
$container = New-AzContainerInstanceObject -Name $containerName -Image peterdavehello/azcopy -Command $command
$containerGroup = New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerName -Location $location -Container $container -OsType Linux
