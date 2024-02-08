data "azurerm_virtual_network" "vnet1" {
  name                = var.netname
  resource_group_name = var.rgname
}
data "azurerm_virtual_network" "vnet2" {
  name                = var.netname2
  resource_group_name = var.rgname2
}

resource "azurerm_virtual_network_peering" "peerings" {
  name                      = var.name
  resource_group_name       = var.rgname
  virtual_network_name      = var.netname
  remote_virtual_network_id = data.azurerm_virtual_network.vnet2.id

}
resource "azurerm_virtual_network_peering" "peerings2" {
  name                      = var.name2
  resource_group_name       = var.rgname2
  virtual_network_name      = var.netname2
  remote_virtual_network_id = data.azurerm_virtual_network.vnet1.id
}