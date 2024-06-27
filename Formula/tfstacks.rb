# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/tfstacks/0.3.0/tfstacks_0.3.0_darwin_amd64.zip"
    sha256 "6297ebd21eae0039ed60c3cb50293adcca15a6e797d4c92da6829a0b426abe83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/tfstacks/0.3.0/tfstacks_0.3.0_darwin_arm64.zip"
    sha256 "b29e66821a9fa28ea0628ca84889dcc8c322bc9b6d38f0e89434c232f4207b40"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/tfstacks/0.3.0/tfstacks_0.3.0_linux_amd64.zip"
    sha256 "c403598a931b8392645e65c8772ec3271db4bac7ffa7fab43449c5e0cbf4faf2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/tfstacks/0.3.0/tfstacks_0.3.0_linux_arm.zip"
    sha256 "23b6a7797782e2920daa44b9f4eaf3354f883eab67d602e650b937eb27c3dd1a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/tfstacks/0.3.0/tfstacks_0.3.0_linux_arm64.zip"
    sha256 "842234946a20a25c5d930770366d60e929476b403a7e20034bc6e368a2c9ca5f"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
