resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { 
      webservers =  yandex_compute_instance.web, 
      databases  =  yandex_compute_instance.database_vm,
      storage    =  [yandex_compute_instance.storage_vm] 
    }
    
    )

  filename = "${abspath(path.module)}/hosts.cfg"
}

# resource "local_file" "hosts_cfg" {
#   content = templatefile("${path.module}/hosts.tftpl",

#     { 
#       webservers =  yandex_compute_instance.web    
#       databases  = yandex_compute_instance.database_vm 
#       storage    = yandex_compute_instance.storage_vm
#     }
#      )

#   filename = "${abspath(path.module)}/hosts.cfg"
# }






