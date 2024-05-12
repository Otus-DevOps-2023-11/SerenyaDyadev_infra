output "external_ip_address_db_static" {
  value = yandex_compute_instance.db.network_interface.0.nat_ip_address
}

output "external_ip_address_db_lan" {
  value = yandex_compute_instance.db.network_interface.0.ip_address
}
