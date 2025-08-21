# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.0.0/tfstacks_1.0.0_darwin_amd64.zip"
    sha256 "af9d79038e364cee9b2893c56ee838d738ad5e004502ef5f7d2b6bfe08643134"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/1.0.0/tfstacks_1.0.0_darwin_arm64.zip"
    sha256 "db02e6c9053db1ea8f7b35edb9580c4fec081ce659b1a563f36f8dec8d1a6a9e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.0.0/tfstacks_1.0.0_linux_amd64.zip"
    sha256 "59d54736cb2a0558838f9a5f562667a7eeaa529d6ea30d30f4fe8d9b26d8fc0e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.0.0/tfstacks_1.0.0_linux_arm.zip"
    sha256 "5a974762c9bae5104a870d1840cde2b17e7c6d66a33a3477ee047c28a115ec9b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.0.0/tfstacks_1.0.0_linux_arm64.zip"
    sha256 "fc7a28291359a33482071af5d86f6679507fb02533d4ad6c0f67e281cf53ca22"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
