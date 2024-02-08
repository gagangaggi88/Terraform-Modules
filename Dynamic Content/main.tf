resource "azurerm_virtual_network" "vnet1" {
  for_each            = var.virtualnetwork
  name                = each.value.vnetname1
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space

  dynamic "subnet" {

    for_each = var.subnetgaggivnet

    content {
      name           = subnet.value.subnet_name
      address_prefix = subnet.value.subnet_address
    }
  }

#   dynamic "subnet" {

#     for_each = var.subnetgaggivnet1

#     content {
#       name           = subnet.value.subnet_name
#       address_prefix = subnet.value.subnet_address
#     }
#   }
}