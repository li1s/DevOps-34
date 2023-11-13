data "yandex_compute_image" "ubuntu_storage" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "storage_vm" {
  name        = "storage"
  platform_id = var.vm_platform

  resources {
    cores         = var.vms_resources.vm_web_resources.cores 
    memory        = var.vms_resources.vm_web_resources.memory
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      device_name = secondary_disk.value.name
      disk_id     = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id = var.vpc_name
    nat       = true
  }
}
resource "yandex_compute_disk" "storage_disk" {
  count       = 3
  name        = "storage-disk-${count.index + 1}"
  size        = 1
  description = "Storage Disk for homework Terraform-03"
  zone        = var.default_zone
  
}
