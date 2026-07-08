# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "1.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.3.0/tfstacks_1.3.0_darwin_amd64.zip"
    sha256 "e266e65f42685046f8311317d98b4108824932129e1401d895e9b0c0f45d6f25"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/1.3.0/tfstacks_1.3.0_darwin_arm64.zip"
    sha256 "3953ae9ab8b81d27e46993d491824709d260fc506692186bab210eaf89a25375"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.3.0/tfstacks_1.3.0_linux_amd64.zip"
    sha256 "21d9dcbabce95e73a3a8d1a50503d4bf2304af7b8f094f0085cf317a2b2e0389"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.3.0/tfstacks_1.3.0_linux_arm.zip"
    sha256 "dc42331145ed63772ee7d37e662e0c00ad3bff8da77213f82f754a4ffd741fa6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.3.0/tfstacks_1.3.0_linux_arm64.zip"
    sha256 "c3727bff8f6d9ad481a9b0c62dc6044466076b7e72a260081bf17b67f93b94b1"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
