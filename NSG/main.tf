resource "azurerm_network_security_group" "NSG" {
  for_each = var.azurerm_network_security_group
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname


  dynamic "nsgrule" {
    for_each = var.nsgrule
    content {
    name                       = nsgrule.value.nsgname
    priority                   = nsgrule.value.nsgpriority
    direction                  = nsgrule.value.nsgdirection
    access                     = nsgrule.value.nsgaccess
    protocol                   = nsgrule.value.nsgprotocol
    source_port_range          = nsgrule.value.nsgsource_port_range
    destination_port_range     = nsgrule.value.nsgdestination_port_range
    source_address_prefix      = nsgrule.value.nsgsource_address_prefix
    destination_address_prefix = nsgrule.value.nsgdestination_address_prefix
    }
  }
}
  }
  resource "azurerm_network_security_rule" "nsgrule1" {
    name                       = "allow_http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = "GAGGIRG1"
  network_security_group_name = azurerm_network_security_group.NSG[each.key].name
  }
