variable "vm_hostname" {
  description = "Уникальное название хоста."
  type        = string
}

variable "virtual_network" {
  description = "Виртуальный коммутатор."
  type        = string
  default = "VM Network"
}

variable "disk_store" {
  description = "Хранилище."
  type        = string
}

variable "disk_size" {
  description = "Размер диска."
  type        = string
}

variable "mac" {
  description = "Уникальный MAC."
  type        = string
}

variable "mem_size" {
  description = "Объем оперативки."
  type        = string
  default = "1024"
}

variable "num_vcpu" {
  description = "Количество CPU."
  type        = string
  default = "8"
}