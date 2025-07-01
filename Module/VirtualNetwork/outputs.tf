output "subnet1_id" {
  description = "The ID of the first subnet."
  value       = azurerm_subnet.this1.id
}

output "subnet2_id" {
  description = "The ID of the second subnet."
  value       = azurerm_subnet.this2.id
}

output "nsg_id" {
  description = "The ID of the network security group."
  value       = azurerm_network_security_group.this.id
}
