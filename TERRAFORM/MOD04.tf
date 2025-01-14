resource "azurerm_cognitive_account" "openai" {
  kind                = "OpenAI"
  location            = "eastus"
  name                = "${local.lab04_name}-aoai-${local.random_str}"
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"

  tags = {
    environment = local.group_name
  }
}

resource "azurerm_cognitive_deployment" "gpt4omini" {
  name                 = "gpt-35-turbo-16k"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4o-mini"
    version = "2024-07-18"
  }

  scale {
    type = "Standard"
  }
}

resource "azurerm_cognitive_deployment" "gpt4" {
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-05-13"
  }

  scale {
    type = "Standard"
  }
}

resource "azurerm_cognitive_deployment" "dalle3" {
  name                 = "dalle3"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = "OpenAI"
    name    = "dall-e-3"
    version = "3.0"
  }

  scale {
    type = "Standard"
  }
}