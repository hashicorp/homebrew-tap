# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.4.0/tfstacks_0.4.0_darwin_amd64.zip"
    sha256 "023d61800af602068461ad9c16af420dc23df526c18bbbd9bb9a984e549394fa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.4.0/tfstacks_0.4.0_darwin_arm64.zip"
    sha256 "e11c255e4575e6ba2ec07a205ab1a2b6d4e6484e0a41a5f10efc817e88da988d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.4.0/tfstacks_0.4.0_linux_amd64.zip"
    sha256 "2c6572d9493e794ab8dc8a4b8bd855dfd3093fcfdb6d96edd9e8c3dd2237a2de"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.4.0/tfstacks_0.4.0_linux_arm.zip"
    sha256 "d77b40d5591675695775c57c023cceea2c1b89c6bbcfef0a3537fb0f8d66fe60"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.4.0/tfstacks_0.4.0_linux_arm64.zip"
    sha256 "fbfb2d7eb4d7adb44f513ac413f21c029df0c0f7691b66d70f8f2de8efb33a12"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
