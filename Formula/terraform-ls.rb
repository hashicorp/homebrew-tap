# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.6/terraform-ls_0.38.6_darwin_amd64.zip"
    sha256 "9c13350a6d99e48ab6ecaa0b8ad0fe52b7f5651a161091d2ee5d19fba3b25bf6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.6/terraform-ls_0.38.6_darwin_arm64.zip"
    sha256 "ec1e20208ce7da55dc8798e280cc363535793e8827b6f97801184d7f21b2d08b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.6/terraform-ls_0.38.6_linux_amd64.zip"
    sha256 "79877f94a8eb175e6a58cf177839b0801acbfeccf968a2102e95d470fa3ad4a5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.6/terraform-ls_0.38.6_linux_arm.zip"
    sha256 "1e529705bd8e5037c0f0ca8eb6929d10aa77e2d826ed643febdffc28f9a025e4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.6/terraform-ls_0.38.6_linux_arm64.zip"
    sha256 "a44b3df099f0ad8e88c96ea1110f965affee6e69b68ec44df25a593f5ee66cf3"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
