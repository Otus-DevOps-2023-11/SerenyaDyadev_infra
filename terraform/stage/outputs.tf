output "external_ip_address_app_static" {
  value = module.app.external_ip_address_app_static
}
output "external_ip_address_app_lan" {
  value = module.app.external_ip_address_app_lan
}
output "external_ip_address_db_static" {
  value = module.db.external_ip_address_db_static
}

output "external_ip_address_db_lan" {
  value = module.db.external_ip_address_db_lan
}