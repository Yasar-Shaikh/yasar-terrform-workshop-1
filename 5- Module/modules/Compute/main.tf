#nic
resource "azurerm_network_interface" "nic" {
  name                = "${var.env}-${var.project-owner}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  count = var.vm_count
}

#vm
resource "azurerm_windows_virtual_machine" "vm" {
    count = var.vm_count
  name                = "${var.env}-${var.project-owner}-vm-${count.index}"
  computer_name       = "ntms0vm-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = {
    environment = var.env
    module      = "compute"
  }
}