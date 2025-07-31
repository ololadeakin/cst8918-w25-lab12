# outputs.tf - no outputs yet
output "app_subnet_id" {
  value       = azurerm_subnet.app_subnet.id
  description = "The ID of the application subnet"
}