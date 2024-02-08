resource "azuread_user" "azuread_user" {
  for_each            = var.azuread_user
  user_principal_name = each.value.principal_name
  display_name        = each.value.display_name
  password            = each.value.password

}
