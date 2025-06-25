# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.8.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.8.0/consul-terraform-sync_0.8.0_darwin_amd64.zip"
    sha256 "66d2d2feb9ef3ece2213361ce25473ef66c970b977df9bdb4d44e08c8b541790"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.8.0/consul-terraform-sync_0.8.0_linux_amd64.zip"
    sha256 "21171f86059e7f13c9e65c25de02dab079612359bf22690dba9ba23258585849"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.8.0/consul-terraform-sync_0.8.0_linux_arm.zip"
    sha256 "494d077117dd70f59f4ae5fb6ad6a0d72a161d386b2a170d5ee72296bfdbbf50"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.8.0/consul-terraform-sync_0.8.0_linux_arm64.zip"
    sha256 "af7465ca9ff19e12c4737cb38b33d51e79873165fbd0ef5a39fe55f131eaa6c5"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
