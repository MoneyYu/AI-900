resource "azurerm_cognitive_account" "lab02-vision" {
  name                = "${local.lab02_name}-vision-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S1"
  kind                = "ComputerVision"

  tags = {
    environment = local.group_name
  }
}

resource "azurerm_cognitive_account" "lab02-face" {
  name                = "${local.lab02_name}-face-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "Face"

  tags = {
    environment = local.group_name
  }
}

resource "azurerm_cognitive_account" "lab02-custom-training" {
  name                = "${local.lab02_name}-custom-training-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "CustomVision.Training"

  tags = {
    environment = local.group_name
  }
}

resource "azurerm_cognitive_account" "lab02-custom-predict" {
  name                = "${local.lab02_name}-custom-predict-${local.random_str}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "CustomVision.Prediction"

  tags = {
    environment = local.group_name
  }
}