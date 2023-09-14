formula {
    product = "boundary"
    name = "Boundary"
    desc = "Boundary"
    homepage = "https://www.boundaryproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "boundary-enterprise"
    name = "BoundaryEnterprise"
    desc = "Boundary Enterprise"
    homepage = "https://www.boundaryproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "consul"
    name = "Consul"
    desc = "Consul"
    homepage = "https://www.consul.io"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["agent", "-dev", "-bind", "127.0.0.1"]
}

formula {
    product = "consul-enterprise"
    name = "ConsulEnterprise"
    desc = "Consul Enterprise"
    homepage = "https://www.consul.io"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["agent", "-dev", "-bind", "127.0.0.1"]
}

formula {
    product = "consul-aws"
    name = "ConsulAws"
    desc = "Consul AWS"
    homepage = "https://github.com/hashicorp/consul-aws"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = false
        linux_arm64 = true
    }
}


formula {
    product = "vlt"
    name = "Vlt"
    desc = "Vlt CLI"
    homepage = "https://github.com/hashicorp/vlt"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "consul-dataplane"
    name = "ConsulDataplane"
    desc = "Consul Dataplane"
    homepage = "https://github.com/hashicorp/consul-dataplane"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    recommends = ["envoy"]
}

formula {
    product = "consul-esm"
    name = "ConsulEsm"
    desc = "Consul ESM"
    homepage = "https://github.com/hashicorp/consul-esm"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "consul-k8s"
    name = "ConsulK8s"
    desc = "Consul K8s"
    homepage = "https://github.com/hashicorp/consul-k8s"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "consul-template"
    name = "ConsulTemplate"
    desc = "Consul Template"
    homepage = "https://github.com/hashicorp/consul-template"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "consul-terraform-sync"
    name = "ConsulTerraformSync"
    desc = "Consul Terraform Sync"
    homepage = "https://github.com/hashicorp/consul-terraform-sync"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "envconsul"
    name = "Envconsul"
    desc = "Env Consul"
    homepage = "https://github.com/hashicorp/envconsul"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "hc-install"
    name = "HcInstall"
    desc = "hc-install CLI"
    homepage = "https://github.com/hashicorp/hc-install"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "hcdiag"
    name = "Hcdiag"
    desc = "Hcdiag"
    homepage = "https://github.com/hashicorp/hcdiag"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "nomad"
    name = "Nomad"
    desc = "Nomad"
    homepage = "https://www.nomadproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["agent", "-dev"]
}

formula {
    product = "nomad-enterprise"
    name = "NomadEnterprise"
    desc = "Nomad Enterprise"
    homepage = "https://www.nomadproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["agent", "-dev"]
}

formula {
    product = "packer"
    name = "Packer"
    desc = "Packer"
    homepage = "https://www.packer.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "terraform"
    name = "Terraform"
    desc = "Terraform"
    homepage = "https://www.terraform.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "terraform-ls"
    name = "TerraformLs"
    desc = "Terraform Language Server"
    homepage = "https://github.com/hashicorp/terraform-ls"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "vault"
    name = "Vault"
    desc = "Vault"
    homepage = "https://www.vaultproject.io"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["server", "-dev"]
}

formula {
    product = "vault-enterprise"
    name = "VaultEnterprise"
    desc = "Vault Enterprise"
    homepage = "https://www.vaultproject.io"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    service_args = ["server", "-dev"]
}

formula {
    product = "waypoint"
    name = "Waypoint"
    desc = "Waypoint"
    homepage = "https://www.waypointproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

cask {
    product = "boundary-desktop"
    name = "Boundary Desktop"
    desc = ""
    homepage = "https://www.boundaryproject.io/"
    cask_app = "Boundary.app"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
        linux_amd64 = false
        linux_arm = false
        linux_arm64 = false
    }
}

formula {
    product = "sentinel"
    name = "Sentinel"
    desc = ""
    homepage = "https://docs.hashicorp.com/sentinel"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "nomad-pack"
    name = "NomadPack"
    desc = "Nomad Pack"
    homepage = "https://github.com/hashicorp/nomad-pack"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "levant"
    name = "Levant"
    desc = "Levant"
    homepage = "https://github.com/hashicorp/levant"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}

formula {
    product = "vagrant"
    name = "Vagrant"
    desc = "Development environment"
    homepage = "https://www.vagrantup.com/"
    architectures {
        darwin_amd64 = false
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = false
        linux_arm64 = false
    }
}

cask {
    product = "vagrant"
    name = "Vagrant"
    desc = "Development environment"
    homepage = "https://www.vagrantup.com/"
    cask_pkg = "vagrant.pkg"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = false
        linux_arm = false
        linux_arm64 = false
    }
}
