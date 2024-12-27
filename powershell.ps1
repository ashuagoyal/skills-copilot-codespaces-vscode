# Define parameters
param(
    [string]$storageAccountName,
    [string]$resourceGroupName,
    [string]$location = "East US",
    [string]$sku = "Standard_LRS"
)

# Authenticate to Azure
Connect-AzAccount

# Create the resource group if it does not exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName $sku `
    -Kind StorageV2

# Output the storage account details
$storageAccount | Format-List