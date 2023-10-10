variable "vm_db_token" {
  type        = string
  default = var.vm_web_token
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "vm_db_cloud_id" {
  type        = string
  default = "b1gb4hn9obhloadpfp0e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  default     = "b1g5ofg36cpjm42tl9nr"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
 }
variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "e9bsnn14l430roir70g2"
  description = "VPC network & subnet name"
}

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkhlhsKjTpcxnFje4U9yl3i7VFk4KpyDkDJHzSstbHI work-sl"
  description = "ssh-keygen -t ed25519"
}

# variable "vm_db_cores" {
#   type        = string
#   default     = "2"
# }

# variable "vm_db_memory" {
#   type        = string
#   default     = "2"
# }

# variable "vms_ssh_core_fraction" {
#   type        = string
#   default     = "20"
# }


data "yandex_compute_image" "ubuntu-vm-db" {
  family = "ubuntu-2004-lts"
}
  resource "yandex_compute_instance" "platform-db" {
  name        = local.vm_db
  platform_id = var.vm_db_platform_id # Платформы v4 нет + опечатка standarT, а должно быть standarD. ссылка: https://cloud.yandex.ru/docs/compute/concepts/vm-platforms
 
  resources {
    cores         = var.vms_resources.vm_db_resources.cores # Минимальное значение vCPU = 2. ccылка: https://cloud.yandex.ru/docs/compute/concepts/performance-levels
    memory        = var.vms_resources.vm_db_resources.memory
    core_fraction = var.vms_resources.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = var.vm_db_vpc_name
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
  }