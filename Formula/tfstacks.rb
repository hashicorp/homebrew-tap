# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.1/tfstacks_0.5.1_darwin_amd64.zip"
    sha256 "652b7a3b1e42f8da330c1898560b038de54dba5f2d3b1188ffc304ba0ad2b61d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.5.1/tfstacks_0.5.1_darwin_arm64.zip"
    sha256 "ae0ee855a2e8d9fea3f38ebe3526ae8ce402e5262fc9c9d6cb028064a06ab021"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.1/tfstacks_0.5.1_linux_amd64.zip"
    sha256 "9f2518121eb19bcf54ce7c19384ff747c79e118add0648c99111f34934fafac9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.1/tfstacks_0.5.1_linux_arm.zip"
    sha256 "b433d1adfb634116efd2133d8f22e9190f1e5f0095dca7a1a321a3ec69b29894"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.1/tfstacks_0.5.1_linux_arm64.zip"
    sha256 "ed0234a77376b1df9c7c4c743391adf03a6b85e067b0cff661fb837509d0501e"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
