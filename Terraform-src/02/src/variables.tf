##cloud vars
variable "vm_web_token" {
  type        = string
  default = "YC-TOKEN" # Храним как зерицу ока
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "vm_web_cloud_id" {
  type        = string
  default = "b1gb4hn9obhloadpfp0e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_web_folder_id" {
  type        = string
  default = "b1g5ofg36cpjm42tl9nr"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_web_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "e9bsnn14l430roir70g2"
  description = "VPC network & subnet name"
}

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkhlhsKjTpcxnFje4U9yl3i7VFk4KpyDkDJHzSstbHI work-sl"
#   description = "ssh-keygen -t ed25519"
# }

variable "vms_resources" {
  type = map
  default = {
    vm_web_resources = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores = 2
      memory = 2
      core_fraction = 20
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

variable "company" {
  default = "netology"
}

variable "dev" {
  default = "develop"
}

variable "vm_name" {
  default = "plarform"
}

variable "vm_web" {
  default = "web"
}
variable "vm_db" {
  default = "db"
}