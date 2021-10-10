resource "azurerm_route_table" "Route_Table" {
  name                          = var.routetable[0]
  location                      = azurerm_resource_group.RG.location
  resource_group_name           = azurerm_resource_group.RG.name
  disable_bgp_route_propagation = false

  route {
    name           = var.route[0].name
    address_prefix = var.route[0].addressprefix
    next_hop_type  = var.route[0].next_hop_type
    next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address
  }
  route {
    name           = var.route[2].name
    address_prefix = var.route[2].addressprefix
    next_hop_type  = var.route[2].next_hop_type
    next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "Spoke1-Associate" {
  subnet_id      = azurerm_subnet.spoke1-subnet.id
  route_table_id = azurerm_route_table.Route_Table.id
}

resource "azurerm_route_table" "Route_Table1" {
  name                = var.routetable[1]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  route {
    name                = var.route[1].name
    address_prefix      = var.route[1].addressprefix
    next_hop_type       = var.route[1].next_hop_type
    next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address
}
route {
    name           = var.route[2].name
    address_prefix = var.route[2].addressprefix
    next_hop_type  = var.route[2].next_hop_type
    next_hop_in_ip_address = azurerm_firewall.Firewall.ip_configuration[0].private_ip_address
  }

}

resource "azurerm_subnet_route_table_association" "Spoke2-Associate" {
  subnet_id      = azurerm_subnet.spoke2-subnet.id
  route_table_id = azurerm_route_table.Route_Table1.id
}




