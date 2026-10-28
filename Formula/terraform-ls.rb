# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.39.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.39.1/terraform-ls_0.39.1_darwin_amd64.zip"
    sha256 "25814afdbec9163de4ad8db58960195b9fc65ddc5405a5df7163bbdbd08b5325"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.39.1/terraform-ls_0.39.1_darwin_arm64.zip"
    sha256 "07748aa989fc3b9f6e4538ff83bc2e607ebc20c7587ce6556ae555d631e70b1b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.39.1/terraform-ls_0.39.1_linux_amd64.zip"
    sha256 "fe2a158e4a1a8ec8047dae9e06c439b468412aa579929ba28b2e1258cedef9c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.39.1/terraform-ls_0.39.1_linux_arm.zip"
    sha256 "f9c1061228fca242177851843a0791254a133e726b4de676fd9aa53fd7197e21"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.39.1/terraform-ls_0.39.1_linux_arm64.zip"
    sha256 "a72a6d9f72580cfc30cc06d3c973fd5f55790f62e3ddb195998435070d9af36d"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
