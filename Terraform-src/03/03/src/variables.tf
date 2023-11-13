variable "token" {
  type        = string
  default = "" # Храним как зерицу ока
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default = "b1gb4hn9obhloadpfp0e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1g5ofg36cpjm42tl9nr"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_platform" {
  type    = string
  default = "standard-v1"
}
variable "os_family" {
  default = "ubuntu-2004-lts"
  
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "e9b2vloo19q783vlhkfj"
  description = "VPC network & subnet name"
}

variable "network_id" {
  default = "enplurcd3mufctmb5l8i"
  
}
variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkhlhsKjTpcxnFje4U9yl3i7VFk4KpyDkDJHzSstbHI work-sl"
}

variable "count_vm" {
  default = "2"
# default = "5"
}

variable "vms_resources" {
  type = map
  default = {
    vm_web_resources = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
  }
}


variable "metadata" {
  type = map
  default = {
    serial-port-enable = true
    ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkhlhsKjTpcxnFje4U9yl3i7VFk4KpyDkDJHzSstbHI work-sl"
  }
}

