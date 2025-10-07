# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "demo-crud-rg"
  location = "East Asia"
}

# 2. App Service Plan (tempat hosting App Service)
resource "azurerm_service_plan" "appserviceplan" {
  name                = "demo-crud-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1" # Basic tier
}

# 3. Web App (App Service)
resource "azurerm_linux_web_app" "webapp" {
  name                = "demo-crud-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    MONGODB_URL = azurerm_cosmosdb_account.cosmosdb.connection_strings[0]
  }
}

# 4. Cosmos DB (MongoDB API)
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "democrudcosmos"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}
