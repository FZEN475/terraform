


resource "esxi_guest" "base" {
  guest_name = var.vm_hostname
  disk_store = var.disk_store
  boot_firmware      = "efi"
  guest_startup_timeout = 600
  guestos = "ubuntu-64"
  power      = "on"
  memsize    = var.mem_size
  numvcpus   = var.num_vcpu
  boot_disk_type = "thin"
  boot_disk_size = var.disk_size
  network_interfaces {
    virtual_network = var.virtual_network
    mac_address     = var.mac
    nic_type        = "e1000"
  }
}

