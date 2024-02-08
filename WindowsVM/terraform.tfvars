rg_name  = "GAGGIRG2"
location = "east us"

virtual_machine = {
  vm1 = {
    nic_name = "gaggiwvm-nic"
    nsg      = "GAGGIWVMNSG"
    pip      = "gaggiwvm-ip"
    vm_name  = "GAGGIWVM"
  }
}