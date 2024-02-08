data "azurerm_virtual_network" "vnet" {
  for_each            = var.loadbalancer
  name                = each.value.vnetname
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_machine" "nginxvm01" {
  for_each            = var.loadbalancer
  name                = each.value.vmname
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_machine" "nginxvm02" {
  for_each            = var.loadbalancer
  name                = each.value.vmname1
  resource_group_name = each.value.rg_name
}