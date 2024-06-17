default_zone   = "ru-central1-a"
username       = "slebedev"
ssh_public_key = "~/.ssh/id_ed25519.pub"
vm_packages    = ["vim"]

vpc_params = {
  name = "production"
  subnets = {
    public = { zone = "ru-central1-a", cidr = "192.168.10.0/24" },
  }
}

lamp_group_params = {
  group_name      = "lamp"
  image_family    = "lamp"
  instance_cores  = 2
  instance_memory = 2
  group_size      = 3
  max_unavailable = 1
  max_expansion   = 0
}

storage_params = {
  bucket_name = "slebedev-netology"
  bucket_acl = "public-read"
  object_key = "test.jpg"
  object_source = "files/test.jpg"
  object_acl = "public-read"
}