variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização dos recursos"
  type        = string
}

variable "subnet_id" {
  description = "ID da Subnet onde a VM será criada"
  type        = string
}

variable "vm_name" {
  description = "Nome da Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Tamanho da Virtual Machine"
  type        = string
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
}

variable "image_publisher" {
  description = "Publicador da imagem da VM"
  type        = string
}

variable "image_offer" {
  description = "Oferta da imagem da VM"
  type        = string
}

variable "image_sku" {
  description = "SKU da imagem da VM"
  type        = string
}

variable "image_version" {
  description = "Versão da imagem da VM"
  type        = string
}
