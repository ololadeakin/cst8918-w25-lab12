# outputs.tf - no outputs yet
output "app_subnet_id" {
  value       = azurerm_subnet.app_subnet.id
  description = "The ID of the application subnet"
}

output "app_public_ip_address" {
  value       = azurerm_public_ip.app_ip.ip_address
  description = "The static public IP address for the application"
}