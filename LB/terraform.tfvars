loadbalancer = {
  lb1 = {
    lbpipname       = "gaggilbpip"
    location        = "central india"
    rg_name         = "GAGGIRG1"
    lbname          = "gaggiNginxLoadBalancer"
    frontendipname  = "GAGGIPublicIPAddress"
    vnetname        = "GAGGIVNET1"
    vmname          = "GAGGILVM"
    vmname1         = "GAGGILVM1"
    bkpname         = "gaggiBackEndAddressPool"
    bkpaddressname  = "gaggibackendnginx01"
    bkpaddressname1 = "gaggibackendnginx02"
  }
}