azurerm_network_security_group = {
    nsg1 = {
        name = "gaggi-nsg1"
        location = "central india"
        rgname = "GAGGIRG1"
    }
}

nsgrule = {
    rule1 = {
    nsgname                       = "allow_http"
    nsgpriority                   = 1001
    nsgdirection                  = "Inbound"
    nsgaccess                     = "Allow"
    nsgprotocol                   = "Tcp"
    nsgsource_port_range          = "*"
    nsgdestination_port_range     = "80"
    nsgsource_address_prefix      = "*"
    nsgdestination_address_prefix = "*"
    }
}