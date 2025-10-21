variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
  default     = "rg-vm-test"
}

variable "location" {
  description = "Localização dos recursos"
  type        = string
  default     = "West US 3"
}

variable "vnet_name" {
  description = "Nome da Virtual Network"
  type        = string
  default     = "vnet-test"
}

variable "address_space" {
  description = "Faixa de endereços da VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Nome da Subnet"
  type        = string
  default     = "subnet-test"
}

variable "subnet_prefix" {
  description = "Prefixo da Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vm_name" {
  description = "Nome da Virtual Machine"
  type        = string
  default     = "vm-test"
}

variable "vm_size" {
  description = "Tamanho da Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Usuário administrador da VM"
  type        = string
}

variable "admin_password" {
  description = "Senha do administrador da VM"
  type        = string
  sensitive   = true
}

variable "os_disk_size_gb" {
  description = "Tamanho do disco do sistema operacional"
  type        = number
  default     = 30
}

variable "image_publisher" {
  description = "Publicador da imagem da VM"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Oferta da imagem da VM"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "SKU da imagem da VM"
  type        = string
  default     = "22_04-LTS"
}

variable "image_version" {
  description = "Versão da imagem da VM"
  type        = string
  default     = "latest"
}
