# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.7.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.2/consul-terraform-sync_0.7.2_darwin_amd64.zip"
    sha256 "3553a1667c927e52bb4988b459c3b8a2f2ff30cac784a526f0580d2b1a2d7b1e"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.2/consul-terraform-sync_0.7.2_linux_amd64.zip"
    sha256 "e3ed718f6e6ab5b32c841732f01ab3f348d747216f35c3f1867cda6fdcfab461"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.2/consul-terraform-sync_0.7.2_linux_arm.zip"
    sha256 "efdd4453215e50b083bfdf2ae3eec6dfa713024dd09d12d238e9953240c64b52"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.2/consul-terraform-sync_0.7.2_linux_arm64.zip"
    sha256 "9cfd572286a92be5f956a0885480464d193d3be2f4ac82d8fc8ab4dbfca3b50a"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
