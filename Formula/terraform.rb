# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.9/terraform_1.14.9_darwin_amd64.zip"
    sha256 "c15326e1af102d2767d40208a0157d1402057f80192991f56803b66457304cf3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.9/terraform_1.14.9_darwin_arm64.zip"
    sha256 "5bc0b11b7a63c8984a41d82523356df46f7833c2e9651a39a7f8919422de5cde"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.9/terraform_1.14.9_linux_amd64.zip"
    sha256 "2e5cffc20a0b48a67a76268723bd5a10b8666f69b2aa4f04906e206726bedd63"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.9/terraform_1.14.9_linux_arm.zip"
    sha256 "0086d4f9b58a83e37b2e6754f7a90139c643991e5674ed766b2be0e497c2a0f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.9/terraform_1.14.9_linux_arm64.zip"
    sha256 "863002085b886453795d9ff4b8989b8468784478150b70ba8a1df3e3ad66da99"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
