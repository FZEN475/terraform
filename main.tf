

provider "esxi" {
  esxi_hostname      = var.esxi_hostname
  esxi_hostport      = var.esxi_hostport
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
}

variable "control" {
  description = "Control"
  type = map(object({
    hostname = string
    mac = string
    disk_store = string
    disk_size = string
  }))
  default = {
    "host1" = {
      hostname = "control02"
      mac = "00:50:56:A1:68:24"
      disk_store = "datastore0"
      disk_size = "50"
    },
    "host2" = {
      hostname = "control03"
      mac = "00:50:56:A0:5F:05"
      disk_store = "datastore1"
      disk_size = "50"
    }
  }


}

variable "storage" {
  description = "Storage"
  type = map(object({
    hostname = string
    mac = string
    disk_store = string
    disk_size = string
  }))
  default = {
    "host1" = {
      hostname = "storage01"
      mac = "00:50:56:A2:AA:43"
      disk_store = "datastore1"
      disk_size = "50"
    }
  }


}


variable "dev" {
  description = "Dev"
  type = map(object({
    hostname = string
    mac = string
    disk_store = string
    disk_size = string
  }))
  default = {
    "host1" = {
      hostname = "dev01"
      mac = "00:50:56:A1:08:2A"
      disk_store = "datastore1"
      disk_size = "50"
    }
  }


}



variable "prod" {
  description = "Prod"
  type = map(object({
    hostname = string
    mac = string
    disk_store = string
    disk_size = string
  }))
  default = {
    "host1" = {
      hostname = "prod01"
      mac = "00:50:56:AC:E7:39"
      disk_store = "datastore1"
      disk_size = "50"
    }
  }
}

module "control_main" {
  source = "./modules/base"
  vm_hostname = "control01"
  mac = "00:50:56:a1:b1:c2"

  disk_store = "datastore0"
  disk_size = "50"
  mem_size = "6144"
}

module "control" {
  source = "./modules/base"
  for_each = var.control
  vm_hostname = each.value.hostname
  mac = each.value.mac

  disk_store = each.value.disk_store
  disk_size = each.value.disk_size
  mem_size = "6144"
}

module "storage" {
  source = "./modules/base"
  for_each = var.storage
  vm_hostname = each.value.hostname
  mac = each.value.mac

  disk_store = each.value.disk_store
  disk_size = each.value.disk_size
  mem_size = "6144"
}

module "dev" {
  source = "./modules/base"
  for_each = var.dev
  vm_hostname = each.value.hostname
  mac = each.value.mac

  disk_store = each.value.disk_store
  disk_size = each.value.disk_size
  mem_size = "6144"
}

module "prod" {
  source = "./modules/base"
  for_each = var.prod
  vm_hostname = each.value.hostname
  mac = each.value.mac

  disk_store = each.value.disk_store
  disk_size = each.value.disk_size
  mem_size = "6144"
}