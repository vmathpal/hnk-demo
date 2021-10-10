resource "azurerm_resource_group" "RG" {
  name     = var.RG
  location = var.location
  

}
resource "azurerm_virtual_network" "hub-vnet" {
  name                = var.cidrs[0].name
  address_space       = [var.cidrs[0].cidr]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "hub-subnet" {
  name                 = var.cidrs[1].name
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [var.cidrs[1].cidr]

}

resource "azurerm_virtual_network" "spoke1-vnet" {
  name                = var.cidrs[2].name
  address_space       = [var.cidrs[2].cidr]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "spoke1-subnet" {
  name                 = var.cidrs[3].name
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.spoke1-vnet.name
  address_prefixes     = [var.cidrs[3].cidr]

}

resource "azurerm_network_interface" "spoke1-nic" {
  name                = var.nic_name[0]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke1-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_network" "spoke2-vnet" {
  name                = var.cidrs[4].name
  address_space       = [var.cidrs[4].cidr]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "spoke2-subnet" {
  name                 = var.cidrs[5].name
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.spoke2-vnet.name
  address_prefixes     = [var.cidrs[5].cidr]

}

resource "azurerm_network_interface" "spoke2-nic" {
  name                = var.nic_name[1]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke2-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
