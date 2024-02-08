resource "azurerm_storage_account" "storage" {
  for_each                 = var.storageaccount
  name                     = each.value.storagename
  resource_group_name      = each.value.rgname
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

 tags = {
   environment = "staging"
 }
 }


#  resource "azurerm_storage_account" "storageaccount" {
#     access_tier                       = "Hot"
#     account_kind                      = "StorageV2"
#     account_replication_type          = "LRS"
#     account_tier                      = "Standard"
#     allow_nested_items_to_be_public   = false
#     cross_tenant_replication_enabled  = false
#     default_to_oauth_authentication   = false
#     enable_https_traffic_only         = true
#     id                                = "/subscriptions/00b9c8ab-f7d4-4c4f-ac56-7e2b38ca92de/resourceGroups/azureapp-auto-alerts-cfdfb8-chanchalkaushik1992_outlook_com/providers/Microsoft.Storage/storageAccounts/gaggist11"
#     infrastructure_encryption_enabled = false
#     is_hns_enabled                    = false
#     location                          = "centralindia"
#     min_tls_version                   = "TLS1_2"
#     name                              = "gaggist11"
#     nfsv3_enabled                     = false
#     primary_access_key                = (sensitive value)
#     primary_blob_connection_string    = (sensitive value)
#     primary_blob_endpoint             = "https://gaggist11.blob.core.windows.net/"
#     primary_blob_host                 = "gaggist11.blob.core.windows.net"
#     primary_connection_string         = (sensitive value)
#     primary_dfs_endpoint              = "https://gaggist11.dfs.core.windows.net/"
#     primary_dfs_host                  = "gaggist11.dfs.core.windows.net"
#     primary_file_endpoint             = "https://gaggist11.file.core.windows.net/"
#     primary_file_host                 = "gaggist11.file.core.windows.net"
#     primary_location                  = "centralindia"
#     primary_queue_endpoint            = "https://gaggist11.queue.core.windows.net/"
#     primary_queue_host                = "gaggist11.queue.core.windows.net"
#     primary_table_endpoint            = "https://gaggist11.table.core.windows.net/"
#     primary_table_host                = "gaggist11.table.core.windows.net"
#     primary_web_endpoint              = "https://gaggist11.z29.web.core.windows.net/"
#     primary_web_host                  = "gaggist11.z29.web.core.windows.net"
#     public_network_access_enabled     = true
#     queue_encryption_key_type         = "Service"
#     resource_group_name               = "azureapp-auto-alerts-cfdfb8-chanchalkaushik1992_outlook_com"
#     secondary_access_key              = (sensitive value)
#     secondary_connection_string       = (sensitive value)
#     sftp_enabled                      = false
#     shared_access_key_enabled         = true
#     table_encryption_key_type         = "Service"
#     tags                              = {}

#     blob_properties {
#         change_feed_enabled           = false
#         change_feed_retention_in_days = 0
#         last_access_time_enabled      = false
#         versioning_enabled            = false

#         container_delete_retention_policy {
#             days = 7
#         }

#         delete_retention_policy {
#             days = 90
#         }
#     }

#     network_rules {
#         bypass                     = [
#             "AzureServices",
#         ]
#         default_action             = "Allow"
#         ip_rules                   = []
#         virtual_network_subnet_ids = []
#     }

#     queue_properties {
#         hour_metrics {
#             enabled               = true
#             include_apis          = true
#             retention_policy_days = 7
#             version               = "1.0"
#         }
#         logging {
#             delete                = false
#             read                  = false
#             retention_policy_days = 0
#             version               = "1.0"
#             write                 = false
#         }
#         minute_metrics {
#             enabled               = false
#             include_apis          = false
#             retention_policy_days = 0
#             version               = "1.0"
#         }
#     }

#     share_properties {
#         retention_policy {
#             days = 7
#         }
#     }
# }