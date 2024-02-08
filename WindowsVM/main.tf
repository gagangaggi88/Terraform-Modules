data "azurerm_subnet" "subnet" {
  name                 = "frontend22"
  virtual_network_name = "GAGGIVNET2"
  resource_group_name  = var.rg_name
}

data "azurerm_key_vault" "keyvault" {
  name                = "gaggikeyvault1"
  resource_group_name = "GAGGIRG1"
}

data "azurerm_key_vault_secret" "keyvaultsecret1" {
  name         = "gaggiusername"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "keyvaultsecret2" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


resource "azurerm_public_ip" "publicip" {
  for_each            = var.virtual_machine
  name                = each.value.pip
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.virtual_machine
  name                = each.value.nsg
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389" # RDP port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443" # HTTPS port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.virtual_machine
  name                = each.value.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[each.key].id
  }
}
resource "azurerm_windows_virtual_machine" "wvm" {
  for_each            = var.virtual_machine
  name                = each.value.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.keyvaultsecret1.value
  admin_password      = data.azurerm_key_vault_secret.keyvaultsecret2.value
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}