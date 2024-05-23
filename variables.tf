variable "project_id" {
  description = "HCP Project ID"
  type        = string
  default     = "11eab1a9-65e9-7b03-adc9-0242ac11000a"
}

variable "app_name" {
  description = "HVS App Name"
  type        = string
  default     = "vault-ent"
}

variable "vault_addr" {
  description = "Vault Ent Adress"
  type        = string
  default     = "https://vault-cluster-public-vault-da9afe43.075d3209.z1.hashicorp.cloud:8200"
}

variable "namespace" {
  description = "Vault Ent Namespace"
  type        = string
  default     = "admin"
}

variable "VAULT_TOKEN" {
  description = "Vault Token"
  type        = string
}
