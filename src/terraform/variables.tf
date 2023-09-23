# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gb4hn9obhloadpfp0e"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g5ofg36cpjm42tl9nr"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "debian-11" {
  default = "fd8vmbs0ap6q8bka0vp5"
}