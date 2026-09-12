resource "azurerm_network_interface" "network_interfaces" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.nic_resource_group_name
  location            = each.value.nic_location

  ip_configuration {
    name                          = "dhaka"
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "virtual_machines" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.vm_resource_group_name
  location                        = each.value.vm_location
  size                            = each.value.vm_size
  admin_username                  = each.value.vm_admin_username
  admin_password                  = each.value.vm_admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.network_interfaces[each.key].id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

  }
}
  