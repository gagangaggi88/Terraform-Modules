resource "azurerm_public_ip" "PublicIPForLB" {
  for_each            = var.loadbalancer
  name                = each.value.lbpipname
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "NginxLoadBalancer" {
  for_each            = var.loadbalancer
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = each.value.frontendipname
    public_ip_address_id = azurerm_public_ip.PublicIPForLB[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "BackEndAddressPool" {
  for_each        = var.loadbalancer
  loadbalancer_id = azurerm_lb.NginxLoadBalancer[each.key].id
  name            = each.value.bkpname
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx01" {
  for_each                = var.loadbalancer
  name                    = each.value.bkpaddressname
  backend_address_pool_id = azurerm_lb_backend_address_pool.BackEndAddressPool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.vnet[each.key].id
  ip_address              = data.azurerm_virtual_machine.nginxvm01[each.key].private_ip_address
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx02" {
  for_each                = var.loadbalancer
  name                    = each.value.bkpaddressname1
  backend_address_pool_id = azurerm_lb_backend_address_pool.BackEndAddressPool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.vnet[each.key].id
  ip_address              = data.azurerm_virtual_machine.nginxvm02[each.key].private_ip_address
}

resource "azurerm_lb_probe" "nginxprobe" {
  for_each        = var.loadbalancer
  loadbalancer_id = azurerm_lb.NginxLoadBalancer[each.key].id
  name            = "http-port"
  port            = 80
}

resource "azurerm_lb_rule" "lbrule" {
  for_each = var.loadbalancer
  loadbalancer_id                = azurerm_lb.NginxLoadBalancer[each.key].id
  name                           = "NginxRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontendipname
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.BackEndAddressPool[each.key].id]
  probe_id                       = azurerm_lb_probe.nginxprobe[each.key].id
}