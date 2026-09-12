resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.snet_name
  virtual_network_name = each.value.snet_virtual_network_name
  resource_group_name  = each.value.snet_resource_group_name
  address_prefixes     = each.value.snet_address_prefixes
}