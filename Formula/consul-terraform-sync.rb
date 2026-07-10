# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.9.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.1/consul-terraform-sync_0.9.1_darwin_amd64.zip"
    sha256 "9004d6808e8b6c3f44cde4701c45ae9f0643503ef7ffee96a3c14ef47189a116"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.1/consul-terraform-sync_0.9.1_linux_amd64.zip"
    sha256 "4536c56a7d8e6e18f9cd4915d70690b27eec95037e9e5f1d1f764b92da5bd4e3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.1/consul-terraform-sync_0.9.1_linux_arm.zip"
    sha256 "ab799fa142b83634deaad63d98c984878f50f1c67c9d345e4b736d5c2e3eaebe"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.1/consul-terraform-sync_0.9.1_linux_arm64.zip"
    sha256 "e5e93554cf0789f4513078711abe93bb71d5536f8bb722e950fe051f9bde1043"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
