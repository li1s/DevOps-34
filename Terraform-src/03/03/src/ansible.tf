# resource "null_resource" "ansible_inventory" {
#   provisioner "local-exec" {
#     command = <<-EOT
#       echo "[webservers]" > inventory.ini
#       ${templatefile("${path.module}/inventory_template.ini", {
#         webservers = yandex_compute_instance.web.*.network_interface.0.ip_address
#       })}

#       echo "[databases]" >> inventory.ini
#       ${templatefile("${path.module}/inventory_template.ini", {
#         databases = yandex_compute_instance.database_vm.*.network_interface.0.ip_address
#       })}

#       echo "[storage]" >> inventory.ini
#       ${templatefile("${path.module}/inventory_template.ini", {
#         storage = yandex_compute_instance.storage_vm.*.network_interface.0.ip_address
#       })}
#     EOT
#   }
# }

# data "template_file" "inventory_template" {
#   template = file("${path.module}/hosts.tftpl")
# }
# output "inventory_file" {
#   value = null_resource.ansible_inventory.triggers
# }



# resource "local_file" "hosts_cfg" {
#   #content = templatefile("${path.module}/hosts.tftpl",
#   content = templatefile("${path.module}/hosts.tftpl", 
#     {
#       webservers = yandex_compute_instance.web
#       databases  = yandex_compute_instance.database_vm
#       storage    = yandex_compute_instance.storage_vm
#     }
#   )
#   filename       = "${path.module}/hosts.cfg"
# }


resource "local_file" "hosts_cfg" {
  filename = "${path.module}/hosts.cfg"
  content  = templatefile("${path.module}/hosts.tftpl", {
    webservers = yandex_compute_instance.web.*.network_interface.0.nat_ip_address,
    databases  = yandex_compute_instance.database_vm.*.network_interface.0.nat_ip_address,
    storage    = yandex_compute_instance.storage_vm.*.network_interface.0.nat_ip_address
  })
}


# resource "local_file" "hosts_cfg" {
#   filename = "${path.module}/hosts.cfg"
#   content  = templatefile("${path.module}/hosts.tftpl", {
#     webservers = yandex_compute_instance.web.*.network_interface.0.nat_ip_address,
#     databases  = yandex_compute_instance.database_vm.*.network_interface.0.nat_ip_address,
#     storage    = yandex_compute_instance.storage_vm.*.network_interface.0.nat_ip_address
#   })
# }

