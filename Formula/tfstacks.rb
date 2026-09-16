# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "1.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.4.0/tfstacks_1.4.0_darwin_amd64.zip"
    sha256 "c37c19abac9056c9469f65a191b60ce6f1ce2272e01720e785a90425cf52ce42"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/1.4.0/tfstacks_1.4.0_darwin_arm64.zip"
    sha256 "96269405488c9bbf45ff4443963d5586862dde02ce52aaead3dcc914feeb509d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.4.0/tfstacks_1.4.0_linux_amd64.zip"
    sha256 "0bf905fae38df1613fb04957ab08b2f0924c05fd64d2adcae8bbd6736fea4316"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.4.0/tfstacks_1.4.0_linux_arm.zip"
    sha256 "d5ea09ec53e10e936e2fac43555eb1500c146e3955cb30cf563be4ab0049afeb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.4.0/tfstacks_1.4.0_linux_arm64.zip"
    sha256 "1884a28d34c8e1299dcd6dfa1580cb674dd4278c792da22e6576d5d51c703aa5"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
