terraform {
  required_version = ">= 1.5.7"
}

locals {
  template = <<EOT
terraform {
  required_version = ">= 1.5.7"
}

locals {
  template = TEMPLATE
  self     = replace(local.template, base64decode("VEVNUExBVEU="), "<<EOT\n$${replace(local.template, base64decode("JA=="), base64decode("JCQ="))}EOT")
}

output "shasum" {
  value = {
    sha1   = sha1(local.self)
    sha256 = sha256(local.self)
    sha512 = sha512(local.self)
  }
}
EOT
  self     = replace(local.template, base64decode("VEVNUExBVEU="), "<<EOT\n${replace(local.template, base64decode("JA=="), base64decode("JCQ="))}EOT")
}

output "shasum" {
  value = {
    sha1   = sha1(local.self)
    sha256 = sha256(local.self)
    sha512 = sha512(local.self)
  }
}
