resource "azurerm_storage_container" "container" {
  for_each              = var.container
  name                  = each.value.containername
  storage_account_name  = each.value.storagename
  container_access_type = "private"
}


# resource "azurerm_storage_container" "container" {
#     container_access_type   = "private"
#     has_immutability_policy = false
#     has_legal_hold          = false
#     id                      = "https://gaggist11.blob.core.windows.net/gaggicontainer"
#     metadata                = {}
#     name                    = "gaggicontainer"
#     resource_manager_id     = "/subscriptions/00b9c8ab-f7d4-4c4f-ac56-7e2b38ca92de/resourceGroups/azureapp-auto-alerts-cfdfb8-chanchalkaushik1992_outlook_com/providers/Microsoft.Storage/storageAccounts/gaggist11/blobServices/default/containers/gaggicontainer"
#     storage_account_name    = "gaggist11"
# }