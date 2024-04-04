terraform {
  backend "s3" {
    endpoints = {
      s3 = "http://storage.yandexcloud.net"
    }
    bucket = "bucket"
    region = "ru-central1"
    key    = "terraform.tfstate"

    access_key = "access_key"
    secret_key = "secret_key"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}