default_zone   = "ru-central1-a"
site_bucket_params = {
  bucket_name = "slebedev.ru"
  bucket_acl  = "public-read"
}

encrypted_bucket_params = {
  bucket_name = "slebedev-netology"
  bucket_acl  = "public-read"
}
bucket_objects = {
  "test.jpg" = {
    object_source = "files/test.jpg"
    object_acl    = "public-read"
  }
  "index.html" = {
    object_source = "files/index.html"
    object_acl    = "public-read"
  }
}