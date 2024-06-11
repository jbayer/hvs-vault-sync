terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.2.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.91"
    }
  }
}

provider "vault" {
  address = var.vault_addr
  token   = var.VAULT_TOKEN
  namespace = var.namespace
}

provider "hcp" {
  project_id = var.project_id
}

data "hcp_vault_secrets_app" "vault-ent" {
  app_name = var.app_name
}

resource "vault_kv_secret_v2" "from_hvs" {
  mount                      = "sync"
  name                       = "from-hvs"
  data_json                  = jsonencode(data.hcp_vault_secrets_app.vault-ent.secrets)
  custom_metadata {
    max_versions = 2
    data = {
      from_hvs = true
      project_id = var.project_id
      app = var.app_name
    }
  }
}
