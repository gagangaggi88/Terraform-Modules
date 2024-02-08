virtualnetwork = {
  vnet1 = {
    vnetname1     = "GAGGIVNET1"
    location      = "centralindia"
    rg_name       = "GAGGIRG1"
    address_space = ["10.0.0.0/16"]
  },
#   vnet2 = {
#     vnetname1 = "GAGGIVNET2"
#     location             = "east us"
#     rg_name              = "GAGGIRG2"
#     address_space        = ["10.1.0.0/16"]
#   }
}


subnetgaggivnet = {
  subnet1 = {
    vnetname = "GAGGIVNET1"
    subnet_name    = "frontend"
    subnet_address = "10.0.1.0/24"
  },
  subnet2 = {
    vnetname = "GAGGIVNET1"
    subnet_name    = "backend"
    subnet_address = "10.0.2.0/24"
  }
}
# subnetgaggivnet1 = {
#   subnet1 = {
#     subnet_name    = "frontend"
#     subnet_address = "10.1.0.0/24"
#   },
#   subnet2 = {
#     subnet_name    = "backend"
#     subnet_address = "10.1.1.0/24"
#   }
