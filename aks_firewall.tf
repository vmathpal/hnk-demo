resource "azurerm_resource_group" "FirewallRG" {
  name     = var.FirewallRG
  location = var.location
}

resource "azurerm_public_ip" "publicip" {
  name                = var.publicip
  location            = azurerm_resource_group.FirewallRG.location
  resource_group_name = azurerm_resource_group.FirewallRG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "Firewall" {
  name                = var.Firewall
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.hub-subnet.id
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}