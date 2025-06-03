# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.7.4"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.4/consul-terraform-sync_0.7.4_darwin_amd64.zip"
    sha256 "5a7b0c8dd94301aa0afdfd32903adca991082df204e7b92bab75de45edabbeb8"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.4/consul-terraform-sync_0.7.4_linux_amd64.zip"
    sha256 "e3481c9bff7fdc72039a491ade56f766645781882761d1fc4fbff88f6c683289"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.4/consul-terraform-sync_0.7.4_linux_arm.zip"
    sha256 "ac8c3c39b6bfc310138cfc6d2cc74f14e740fee962b38dec6d30cd7b3027e7e0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.4/consul-terraform-sync_0.7.4_linux_arm64.zip"
    sha256 "88c8a1c6c8c9122e7fbcb631d776f76e60ac45f22a46b6ad70b7c7baa95fbcd7"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
