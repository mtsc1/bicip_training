@description('General Parameters')
param location string = 'westeurope'


@description('Storage Account Deployment')
resource SA 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name: 'mtscbiceptestsa'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

@description('FileShare Deployment')
resource FS 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-05-01' = {
  name: '${SA.name}/bicep test/test shares'
  properties: {
    accessTier: 'Cool'
    enabledProtocols: 'SMB'
    shareQuota: 100
      }
}
