resource "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.subnet_address
}