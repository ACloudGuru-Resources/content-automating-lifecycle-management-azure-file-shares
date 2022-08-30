$containerName = "acglab-azcopy"
$resourceGroupName = (Get-AzResourceGroup).Name
$location = (Get-AzResourceGroup).Location
$command = "azcopy","copy","src_url","dest_url","--recursive"
$container = New-AzContainerInstanceObject -Name acglab-azcopy -Image peterdavehello/azcopy -Command $command
$containerGroup = New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerName-cg -Location $location -Container $container -OsType Linux
