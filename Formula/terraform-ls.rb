# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.5/terraform-ls_0.32.5_darwin_amd64.zip"
    sha256 "b96f191350ee1276ae9e17fa788dbfbd942a5ba032e57e9847bc1eb5168a718e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.5/terraform-ls_0.32.5_darwin_arm64.zip"
    sha256 "ed65eed32aa25c0f47ce12ed7b20e6c87cfe1a4f822eb8f9f660e7bd9958afbf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.5/terraform-ls_0.32.5_linux_amd64.zip"
    sha256 "7416ed9a8ebc3c717849618069f7fe9fec7578adb40a2e006970baef5283484d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.5/terraform-ls_0.32.5_linux_arm.zip"
    sha256 "7fae8e36d0fcefb735abdcd662d547e7a148bd4dbe77034c9ec44a0c3e4e4dfc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.5/terraform-ls_0.32.5_linux_arm64.zip"
    sha256 "06a881e4d7adb3368a5700f4334cce14e584c7a714f536331ead89412c5032e1"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
