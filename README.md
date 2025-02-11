# terraform
## Описание
* Используемый образ [terraform](https://github.com/FZEN475/terraform-image.git)
* structure.yaml - дополнительный inventory с иерархией для ansible.
### Control group
SWARM и Служебные поды Kubernetes

| Дополнительно | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:--------------|:-----|:------------|:----------|
| control01     | 8    | 6           | 50        |
| control02     | 8    | 6           | 50        |
| control03     | 8    | 6           | 50        |

### Storage group
Поды баз данных и объектных хранилищ.  
Данные периодически сбрасываются на внешний NAS.  

| Дополнительно | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:--------------|:-----|:------------|:----------|
| storage01     | 8    | 6           | 50        |

### Dev group
Выполнение gitlab runner и тестовые поды.

| Дополнительно | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:--------------|:-----|:------------|:----------|
| dev01         | 8    | 6           | 50        |

### Prod group
Поды релизов.

| Дополнительно | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:--------------|:-----|:------------|:----------|
| prod01        | 8    | 6           | 50        |

## Подготовка
### Требования
| Дополнительно | Значение                                                    | Comment |
|:--------------|:------------------------------------------------------------|:--------|
| Образ         | [terraform](https://github.com/FZEN475/terraform-image.git) |         |

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
