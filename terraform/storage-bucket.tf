terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "centhis-terraform-states"
    region = "ru-central1"
    key    = "stage.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1"
    dynamodb_table    = "table980"
  }
}