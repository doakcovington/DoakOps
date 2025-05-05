param staticSites_doakops_dev_name string

resource staticSites_doakops_dev_name_resource 'Microsoft.Web/staticSites@2024-04-01' = {
  location: 'West US 2'
  name: staticSites_doakops_dev_name
  properties: {
    allowConfigFileUpdates: true
    enterpriseGradeCdnStatus: 'Disabled'
    provider: 'None'
    stagingEnvironmentPolicy: 'Enabled'
  }
  sku: {
    name: 'Free'
    tier: 'Free'
  }
}

resource staticSites_doakops_dev_name_default 'Microsoft.Web/staticSites/basicAuth@2024-04-01' = {
  parent: staticSites_doakops_dev_name_resource
  name: 'default'
  properties: {
    applicableEnvironmentsMode: 'SpecifiedEnvironments'
  }
}
