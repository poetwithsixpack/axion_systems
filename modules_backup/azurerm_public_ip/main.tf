resource "azurerm_public_ip" "public_ips" {
  for_each            = var.pips
  name                = each.value.pip_name
  resource_group_name = each.value.pip_resource_group_name
  location            = each.value.pip_location
  allocation_method   = each.value.pip_allocation_method
}