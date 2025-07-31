# outputs.tf - no outputs yet
output "app_subnet_id" {
  value       = azurerm_subnet.app_subnet.id
  description = "The ID of the application subnet"
}

output "app_vm_public_ip" {
  value       = azurerm_public_ip.app_ip.ip_address
  description = "The public IP of the VM"
}

output "app_vm_fqdn" {
  value       = azurerm_public_ip.app_ip.fqdn
  description = "The DNS name (if you set one) or blank"
}