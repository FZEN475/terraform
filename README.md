# terraform
## Description
* [Плагин esxi.](https://github.com/josenk/terraform-provider-esxi)
### Control group
SWARM и Служебные поды Kubernetes

| Name      | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:----------|:-----|:------------|:----------|
| control01 | 8    | 6           | 50        |
| control02 | 8    | 6           | 50        |
| control03 | 8    | 6           | 50        |

### Storage group
Поды баз данных и объектных хранилищ.  
Данные периодически сбрасываются на внешний NAS.

| Name      | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:----------|:-----|:------------|:----------|
| storage01 | 8    | 6           | 50        |

### Dev group
Выполнение gitlab runner и тестовые поды.

| Name  | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:------|:-----|:------------|:----------|
| dev01 | 8    | 6           | 50        |

### Prod group
Поды релизов.

| Name   | vCPU | vMemory(Gi) | vDisk(Gi) | 
|:-------|:-----|:------------|:----------|
| prod01 | 8    | 6           | 50        |

## Dependency
* [Образ](https://github.com/FZEN475/terraform-image.git)

<details><summary> .env </summary>

```properties
TERRAFORM_REPO="https://github.com/FZEN475/terraform.git"
#GIT_EXTRA_PARAM="-btemp_branch"
ESXI_SERVER=""
SECURE_SERVER=""
SECURE_PATH=""
APPLY="true"
```
</details>
<details><summary> variables.tf </summary>

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
</details>
<details><summary> structure.yaml </summary>

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
</details>

### Results

<details><summary> inventory.json  </summary>

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
  "storage": {
    "hosts": {
      "storage01": null
    }
  }
}
```
</details>

<details><summary> terraform.tfstate  </summary>

```json
{
  "version": 4,
  "terraform_version": "1.10.3",
  "serial": 39,
  "lineage": "6e7d4900-866e-41f1-0219-585fb63fd763",
  "outputs": {
    "control": {
      "value": [
        "control02",
        "control03"
      ],
      "type": [
        "tuple",
        [
          "string",
          "string"
        ]
      ]
    },
    "control_main": {
      "value": [
        "control01"
      ],
      "type": [
        "tuple",
        [
          "string"
        ]
      ]
    },
    "dev": {
      "value": [
        "dev01"
      ],
      "type": [
        "tuple",
        [
          "string"
        ]
      ]
    },
    "prod": {
      "value": [
        "prod01"
      ],
      "type": [
        "tuple",
        [
          "string"
        ]
      ]
    },
    "storage": {
      "value": [
        "storage01"
      ],
      "type": [
        "tuple",
        [
          "string"
        ]
      ]
    }
  },
  "resources": [
  ]
}
```
</details>