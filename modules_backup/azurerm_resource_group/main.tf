resource "azurerm_resource_group" "resoruce_group" {
  for_each = var.rgs
  name     = each.value.rg1_name
  location = each.value.rg1_location
}