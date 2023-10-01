terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
  required_version = ">= 0.13"
}

provider "virtualbox" {
  delay      = 600
  mintimeout = 5
}

resource "virtualbox_vm" "vm-1" {
  name = "Debian-11"
  image = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    device         = "IntelPro1000MTDesktop"
    host_interface = "vboxnet0"
    # On Windows use this instead
    # host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

output "IPAddress" {
  value = element(virtualbox_vm.vm-1.*.network_adapter.0.ipv4_address, 1)
}
