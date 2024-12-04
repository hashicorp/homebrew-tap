# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.6.0/tfstacks_0.6.0_darwin_amd64.zip"
    sha256 "12cf50f51d14c33c72cce196200be594b6b713183d6f396168625f04a7298d9e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.6.0/tfstacks_0.6.0_darwin_arm64.zip"
    sha256 "a39a6aec9dcc75277eb49bdb55a86bfcdaba6100395cf673062e9589a8dfd8e4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.6.0/tfstacks_0.6.0_linux_amd64.zip"
    sha256 "442479de2183ca95e22493e26d81e6d8780952200c619add97181f11400c8c1b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.6.0/tfstacks_0.6.0_linux_arm.zip"
    sha256 "6ec7a85cf6f45c0574e3807d81657a87aae12b11983021b35549b3e5bcbeea40"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.6.0/tfstacks_0.6.0_linux_arm64.zip"
    sha256 "78304307c4f97ae8da6c3cb57e44b2f3d55506f55479494bbcbead6cde1fe8cd"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
