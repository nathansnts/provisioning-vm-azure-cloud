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

variable "virtual_machines" {
  description = "Lista de máquinas virtuais para criar"
  type = map(object({
    name = string
    size = string
  }))
  default = {
    "vm1" = {
      name = "vm-test1"
      size = "Standard_B1ms"
    }
    "vm2" = {
      name = "vm-test2"
      size = "Standard_B1ms"
    }
  }
}

variable "admin_username" {
  description = "Usuário administrador da VM"
  type        = string
}

variable "allowed_ip" {
  description = "Endereço IP permitido para acesso (ex: seu IP público)"
  type        = string
  default     = "0.0.0.0"  # Por padrão permite todos os IPs (Não recomendado para produção)
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
