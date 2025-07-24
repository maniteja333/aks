param location string = resourceGroup().location
param keyVaultName string
param tenantId string
param objectId string  

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: objectId
        permissions: {
          secrets: [
            'get'
            'list'
            'set'
            'delete'
          ]
        }
      }
    ]
    enableRbacAuthorization: false
    enableSoftDelete: true
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}
