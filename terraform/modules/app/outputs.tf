output "external_ip_address_app_static" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}
output "external_ip_address_app_lan" {
  value = yandex_compute_instance.app.network_interface.0.ip_address
}