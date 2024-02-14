# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.7.1"

  if OS.mac?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-terraform-sync/0.7.1/consul-terraform-sync_0.7.1_darwin_amd64.zip"
    sha256 "fc0a19476d28230ea753d11e375f03adc726f14aa12f2ddd89328889a07ff2db"
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
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-terraform-sync/0.7.1/consul-terraform-sync_0.7.1_linux_amd64.zip"
    sha256 "afd03bdd150a1949a65b5b48f7d299eab4f2e93639e2957ec792c2b746e34682"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-terraform-sync/0.7.1/consul-terraform-sync_0.7.1_linux_arm.zip"
    sha256 "a1f632edbe288171b9402c4f6ba98b32a0e87df208b03dc9a51339078e615d8b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-terraform-sync/0.7.1/consul-terraform-sync_0.7.1_linux_arm64.zip"
    sha256 "1f942d8d745b8ddecbf565e6ca57bb9ac3a80c26adee7faa0556737844449ad2"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
