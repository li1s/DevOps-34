 data "yandex_compute_image" "ubuntu_database" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "database_vm" {
  depends_on = [yandex_compute_instance.web]
    for_each = {
    for index, vm in var.vm_resource : vm.vm_name => vm
    }
  name        = each.value.vm_name
  platform_id = var.vm_platform
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.mem
    core_fraction = each.value.frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
 
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
  network_interface {
    subnet_id = var.vpc_name
    nat       = true
  }
} 


variable "vm_resource" {
    type = list (object({
        vm_name         = string
        cpu             = number
        mem             = number
        hdd             = number
        frac            = number
    }))
    default  = [{
        vm_name         = "main"
        cpu             = 2
        mem             = 2
        hdd             = 2 
        frac            = 20
        },
        {
        vm_name         = "replica"
        cpu             = 2
        mem             = 1
        hdd             = 1
        frac            = 5    
        }]
}