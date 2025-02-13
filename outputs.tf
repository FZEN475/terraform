output "control_main" {
  description = "Имя основного управляющего сервера."
  value = [ (module.control_main.hostname) ]
}
output "control" {
  description = "Имена вспомогательных управляющих серверов."

  value = [for names in module.control : names.hostname ]
}
output "storage" {
  description = "Имена storage серверов."

  value = [for names in module.storage : names.hostname ]
}
output "dev" {
  description = "Имена dev серверов."

  value = [for names in module.dev : names.hostname ]
}
output "prod" {
  description = "Имена prod серверов."

  value = [for names in module.prod : names.hostname ]
}