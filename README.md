# terraform_config
## Описание
Для управления esxi используется провайдер josenk/esxi.  
Файлы секретов variables.tf с паролем к esxi и terraform.tfstate с текущей конфигурацией хранятся на "безопасном" сервере.  
Секреты копируются с помощью scp.  
После изменения конфигурации создаётся файл inventory.json для ansible и копируется на "безопасный" сервер.  



## Подготовка
### Требования
| Soft   | Comment                                                         |
|:-------|:----------------------------------------------------------------|
| docker | Локальный или удалённый сервер для сборки и запуска контейнера. | 

| Дополнительно                 | Значение   | Comment                                |
|:------------------------------|:-----------|:---------------------------------------|
| SSH-key "безопасного" сервера | id_ed25519 | Нужно поместить в контейнер как секрет |

## Установка
Запустить docker-compose.yml

### Дополнительно
variables.tf
```terraform
variable "esxi_hostname" {
  default = "esxi"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" {
  default = "xxxxxxxx"
}
```
inventory.json
```json
{
  "control": {
    "hosts": {
      "control02": null,
      "control03": null
    }
  },
  "control_main": {
    "hosts": {
      "control01": null
    }
  },
  "dev": {
    "hosts": {
      "dev01": null
    }
  },
  "prod": {
    "hosts": {
      "prod01": null
    }
  },
  "test": {
    "hosts": {
      "test01": null
    }
  }
}
```

