param staticSites_doakops_prod_name string

resource staticSites_doakops_prod_name_resource 'Microsoft.Web/staticSites@2024-04-01' = {
  location: 'West US 2'
  name: staticSites_doakops_prod_name
  properties: {
    allowConfigFileUpdates: true
    branch: 'main'
    enterpriseGradeCdnStatus: 'Disabled'
    provider: 'GitHub'
    repositoryUrl: 'https://github.com/doakcovington/DoakOps'
    stagingEnvironmentPolicy: 'Enabled'
  }
  sku: {
    name: 'Free'
    tier: 'Free'
  }
}

resource staticSites_doakops_prod_name_default 'Microsoft.Web/staticSites/basicAuth@2024-04-01' = {
  parent: staticSites_doakops_prod_name_resource
  location: 'West US 2'
  name: 'default'
  properties: {
    applicableEnvironmentsMode: 'SpecifiedEnvironments'
  }
}

resource staticSites_doakops_prod_name_www_doakops_com 'Microsoft.Web/staticSites/customDomains@2024-04-01' = {
  parent: staticSites_doakops_prod_name_resource
  location: 'West US 2'
  name: 'www.doakops.com'
  properties: {}
}
