resource "azurerm_virtual_network_peering" "hub_to_spoke1" {
  name                      = "hubtospoke1"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.hub-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.spoke1-vnet.id
}

resource "azurerm_virtual_network_peering" "Spoke1_to_hub" {
  name                      = "Spoke1ToHub"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.spoke1-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub-vnet.id
}


resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
  name                      = "hubtospoke2"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.hub-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.spoke2-vnet.id
}

resource "azurerm_virtual_network_peering" "Spoke2_to_hub" {
  name                      = "Spoke2ToHub"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.spoke2-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub-vnet.id
}
