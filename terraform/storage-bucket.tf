terraform {
  # required_providers {
  #   yandex = {
  #     source = "yandex-cloud/yandex"
  #   }
  # }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "<имя_бакета>"
    region = "ru-central1"
    key    = "<путь_к_файлу_состояния_в_бакете>/<имя_файла_состояния>.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}

provider "yandex" {
  zone = "<зона_доступности_по_умолчанию>"
}