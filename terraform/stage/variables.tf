variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key_file" {
  description = "Path to the key used for ssh connection"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "db_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}
variable "subnet_id" {
  description = "Subnet ID"
}
