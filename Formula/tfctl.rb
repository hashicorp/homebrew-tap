# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Tfctl < Formula
  desc "CLI for Terraform Cloud"
  homepage "https://www.terraform.io"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.3.0/tfctl_0.3.0_darwin_amd64.zip"
    sha256 "a12de01e640cb9dea6080b7e8a2cdb74c5efe466f3ff6ba19c520c03d383dac9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfctl/0.3.0/tfctl_0.3.0_darwin_arm64.zip"
    sha256 "045a5d7ebf2913006213b485353acf7c832bbf28e1cf3a6a34313dd761d4f535"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.3.0/tfctl_0.3.0_linux_amd64.zip"
    sha256 "5526b438bb66c5bc872f55c4bbb7325bb3e9d162ddd392eed3d60f407598cf62"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.3.0/tfctl_0.3.0_linux_arm.zip"
    sha256 "5526b438bb66c5bc872f55c4bbb7325bb3e9d162ddd392eed3d60f407598cf62"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.3.0/tfctl_0.3.0_linux_arm64.zip"
    sha256 "1060b2903cd8f9cb0af5c878cf89790e0f588b735b6715d2eeadd52c5a71f8c5"
  end

  def install
    bin.install "tfctl"
  end

  test do
    system bin/"tfctl", "--version"
  end
end
