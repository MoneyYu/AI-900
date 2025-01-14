resource "azurerm_container_group" "lab01" {
  name                = "${local.group_name_lower}-aci-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "${local.group_name_lower}-aci-${local.random_str}"
  os_type             = "Linux"
  restart_policy      = "OnFailure"

  container {
    name   = "textanalytics"
    image  = "mcr.microsoft.com/azure-cognitive-services/textanalytics/language:latest"
    cpu    = "2"
    memory = "8"

    environment_variables = {
      Eula = "accept"
    }

    secure_environment_variables = {
      ApiKey  = azurerm_cognitive_account.default.primary_access_key
      Billing = azurerm_cognitive_account.default.endpoint
    }

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = local.group_name
  }
}