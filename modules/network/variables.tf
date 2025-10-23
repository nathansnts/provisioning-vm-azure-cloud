variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização dos recursos"
  type        = string
}

variable "vnet_name" {
  description = "Nome da Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Faixa de endereços da VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nome da Subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "Prefixo da Subnet"
  type        = string
}

variable "allowed_ip" {
  description = "Endereço IP permitido para acesso (ex: seu IP público)"
  type        = string
}
