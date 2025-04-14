# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.7.3"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.3/consul-terraform-sync_0.7.3_darwin_amd64.zip"
    sha256 "49b9a8c97b5f58a596984bd63faa2628879f73d991ab44012768863f2f671ea4"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.3/consul-terraform-sync_0.7.3_linux_amd64.zip"
    sha256 "d96637f4be2689a0685d824cfe68597ef0ef9cbcc9ef88efe31e6aee1ef4e0fc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.3/consul-terraform-sync_0.7.3_linux_arm.zip"
    sha256 "82cf33e907a0a1ab378b709cf5edd21b555e8499b268e750199736dbd3bf5393"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.3/consul-terraform-sync_0.7.3_linux_arm64.zip"
    sha256 "4c79f8f1f748ab64d467f74e70e3a8d5a92fedcea7264c9d31dc8fbc8e8ecc73"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
