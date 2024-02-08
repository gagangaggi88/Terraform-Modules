data "azurerm_subnet" "subnet" {
  for_each             = var.linux_virtual_machine
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rg_name
}

data "azurerm_key_vault" "keyvault" {
  for_each            = var.linux_virtual_machine
  name                = each.value.kvvaultname
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "keyvaultsecret1" {
  for_each     = var.linux_virtual_machine
  name         = each.value.kvsname
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}
data "azurerm_key_vault_secret" "keyvaultsecret2" {
  for_each = var.linux_virtual_machine
  name         = each.value.kvspassword
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}


resource "azurerm_public_ip" "publicip" {
  for_each            = var.linux_virtual_machine
  name                = each.value.pipname
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.linux_virtual_machine
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.linux_virtual_machine
  name                = each.value.vmname
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = "Standard_B2s"
  admin_username      = "gaggidevopsadmin"
  admin_password      = "Gaggidevops@1988"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]


  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}