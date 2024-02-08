data "azurerm_key_vault" "KV" {
  name                = "GAGGIKEYVAULT"
  resource_group_name = "GAGGIRG1"
}

resource "azurerm_key_vault_secret" "kvsecret" {
  for_each     = var.keyvaultsecret
  name         = each.value.name
  value        = each.value.keyvalue
  key_vault_id = data.azurerm_key_vault.KV.id
}