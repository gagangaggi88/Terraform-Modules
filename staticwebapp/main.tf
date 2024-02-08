resource "azurerm_static_site" "staticapp" {
    for_each = var.staticwebapp
  name                = each.value.stname
  location            = each.value.location
  resource_group_name = each.value.rgname
}