
resource "azurerm_subnet" "BastionSubnet" {
  name                 = var.cidrs[6].name
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [var.cidrs[6].cidr]
}

resource "azurerm_public_ip" "Bastion-pubip" {
  name                = var.Bastion-pubip
  location            = azurerm_resource_group.FirewallRG.location
  resource_group_name = azurerm_resource_group.FirewallRG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Bastion" {
  name                = var.Bastion
  location            = azurerm_resource_group.FirewallRG.location
  resource_group_name = azurerm_resource_group.FirewallRG.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.BastionSubnet.id
    public_ip_address_id = azurerm_public_ip.Bastion-pubip.id
  }
}