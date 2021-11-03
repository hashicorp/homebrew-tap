
formula {
    product = "boundary"
    name = "Boundary"
    desc = "Boundary"
    homepage = "https://www.boundaryproject.io/"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
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
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = false
        linux_arm64 = true
    }
    plist =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/consul</string>
        <string>agent</string>
        <string>-dev</string>
        <string>-bind</string>
        <string>127.0.0.1</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/consul.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/consul.log</string>
</dict>
</plist>
EOF
    plist_options = "consul agent -dev -bind 127.0.0.1"
}

formula {
    product = "consul-aws"
    name = "ConsulAWS"
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
    product = "consul-esm"
    name = "ConsulESM"
    desc = "Consul ESM"
    homepage = "https://github.com/hashicorp/consul-esm"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
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
        darwin_arm64 = false
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
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = false
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
        linux_arm64 = false
    }
}

formula {
    product = "envconsul"
    name = "EnvConsul"
    desc = "Env Consul"
    homepage = "https://github.com/hashicorp/envconsul"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = false
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
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
    plist =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>
EOF
    plist_options = "nomad agent -dev"
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
    plist =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/vault</string>
        <string>server</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/vault.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/vault.log</string>
</dict>
</plist>
EOF
    plist_options = "vault server -dev"
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
        linux_arm64 = false
    }
}

formula {
    product = "boundary-desktop"
    name = "Boundary Desktop"
    desc = ""
    homepage = "https://www.boundaryproject.io/"
    cask = true
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
        darwin_arm64 = false
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}
