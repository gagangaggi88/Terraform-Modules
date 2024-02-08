data "azurerm_subnet" "subnet" {
  for_each             = var.azurerm_bastion_host
  name                 = each.value.subname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}
resource "azurerm_public_ip" "bastion_pip" {
  for_each            = var.azurerm_bastion_host
  name                = each.value.pipname
  location            = each.value.location # Replace with your location
  resource_group_name = each.value.rgname   # Replace with your resource group name
  allocation_method   = "Static"
  sku                 = "Standard" # Ensure this is set to Standard
}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.azurerm_bastion_host
  name                = each.value.bstname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                 = each.value.ipconfig
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}
