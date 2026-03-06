# 📋 Documentação - Provisionamento de VM no Azure

## 📖 Visão Geral
Projeto Terraform para provisionar uma infraestrutura completa no Azure, incluindo Resource Group, Virtual Network, Security Groups e múltiplas Virtual Machines Linux.

---

## 🏗️ Arquitetura

### Módulos Utilizados
1. **resource_groups** - Cria o agrupamento de recursos
2. **network** - Cria Virtual Network, Subnet e Security Groups
3. **vm** - Cria máquinas virtuais Linux (escalável via `for_each`)

### Fluxo de Dependências
```
Resource Group
    ↓
Network (VNet + Subnet + NSG)
    ↓
Virtual Machines (múltiplas em paralelo)
```

---

## 🔧 Configuração Padrão

| Parâmetro | Valor Padrão |
|-----------|------------|
| Localização | West US 3 |
| VNet CIDR | 10.0.0.0/16 |
| Subnet CIDR | 10.0.1.0/24 |
| Quantidade de VMs | 2 |
| Tamanho VM | Standard_B1ms |
| Sistema Operacional | Ubuntu 22.04 LTS |
| Tamanho Disco | 30 GB |

---

## 📦 Variáveis Principais

| Variável | Tipo | Descrição |
|----------|------|-----------|
| `resource_group_name` | string | Nome do grupo de recursos |
| `location` | string | Região Azure |
| `vnet_name` | string | Nome da Virtual Network |
| `address_space` | list | Faixa de IPs da VNet |
| `subnet_name` | string | Nome da Subnet |
| `subnet_prefix` | string | Prefixo de IP da Subnet |
| `virtual_machines` | map | Definição das VMs (nome e tamanho) |
| `admin_username` | string | Usuário administrador |
| `allowed_ip` | string | IP permitido para acesso SSH |
| `os_disk_size_gb` | number | Tamanho do disco de SO |

---

## 🔐 Segurança

### Network Security Group
- **Regra de Entrada**: Permite SSH (porta 22) apenas do IP especificado
- **Regra Padrão**: Nega todo o tráfego de entrada não autorizado

```
AllowSpecificIP - Protocolo: *, Porta: 22, Origem: <IP_permitido>
DenyAllInbound  - Nega todo tráfego não permitido
```

---

## 📤 Saídas Disponíveis

```hcl
output "resource_group"     - Nome do Resource Group
output "vnet_id"            - ID da Virtual Network
output "subnet_id"          - ID da Subnet
output "name_vnet"          - Nome da VNet
output "name_subnet"        - Nome da Subnet
output "vm_details"         - Detalhes de todas as VMs
  ├── name                  - Nome da VM
  ├── nic_id                - ID da Interface de Rede
  ├── private_ip            - IP privado
  └── public_ip             - IP público estático
```

---

## 🚀 Estrutura de Recursos no Azure

```
Resource Group (rg-vm-test)
├── Virtual Network (vnet-test)
│   └── Subnet (subnet-test)
│       └── Network Security Group (vnet-test-nsg)
│
└── Virtual Machines (criadas em paralelo)
    ├── VM 1 (vm-test1)
    │   ├── Network Interface
    │   └── Public IP
    ├── VM 2 (vm-test2)
    │   ├── Network Interface
    │   └── Public IP
    └── VM N
        ├── Network Interface
        └── Public IP
```

---

## 📚 Arquivos Principais

| Arquivo | Propósito |
|---------|-----------|
| `main.tf` | Orquestra os módulos e suas dependências |
| `providers.tf` | Configuração do provider Azure (v3.0+) |
| `variables.tf` | Definição de todas as variáveis |
| `outputs.tf` | Saídas dos recursos criados |
| `modules/resource_groups/` | Módulo para Resource Group |
| `modules/network/` | Módulo para VNet, Subnet e NSG |
| `modules/vm/` | Módulo para máquinas virtuais |

---

## ⚙️ Como Usar

### 1. Inicializar Terraform
```bash
terraform init
```

### 2. Validar Configuração
```bash
terraform validate
```

### 3. Visualizar Plano
```bash
terraform plan -var="admin_username=azureuser"
```

### 4. Aplicar Configuração
```bash
terraform apply -var="admin_username=azureuser"
```

### 5. Destruir Recursos
```bash
terraform destroy
```

---

## 🔑 Variáveis Obrigatórias

As seguintes variáveis devem ser fornecidas:
- `admin_username` - Usuário administrador da VM
- `admin_password` - Senha do administrador (sensível)

---

## 💡 Pontos Importantes

- ✅ Usa `for_each` para criar múltiplas VMs de forma escalável
- ✅ Cada VM recebe um IP público estático
- ✅ Isolamento de rede com NSG configurado
- ✅ Estrutura modular reutilizável
- ✅ Backend configurável para state remoto no Azure Storage
- ⚠️ IP padrão (0.0.0.0) permite acesso de qualquer lugar - **não recomendado para produção**

---

## 🔄 Backend State

O backend é configurado para armazenar state no Azure Storage:
```hcl
backend "azurerm" {}
```

Requer configuração através da inicialização ou arquivo `.tfvars`.

---

**Última atualização**: Março 2026
