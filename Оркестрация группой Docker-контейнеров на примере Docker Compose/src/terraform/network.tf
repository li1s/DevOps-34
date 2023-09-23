# Network
resource "yandex_vpc_network" "slnet" {
  name = "slnet"
}

resource "yandex_vpc_subnet" "education-subnet" {
  name = "education-subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["10.10.1.0/24"]
}