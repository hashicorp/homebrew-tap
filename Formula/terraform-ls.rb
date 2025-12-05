# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.3/terraform-ls_0.38.3_darwin_amd64.zip"
    sha256 "572986ff273cd2ec811fd3e5a886182d5d97b7ea39d085783195b400b7da1120"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.3/terraform-ls_0.38.3_darwin_arm64.zip"
    sha256 "dab333c067caba930150d9ecb5116fd04e81dfaed09c977d6c9a70cd3aa4903c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.3/terraform-ls_0.38.3_linux_amd64.zip"
    sha256 "42be7b55640630baaf62186349e724e59f34281db9665578a427d7692f2864d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.3/terraform-ls_0.38.3_linux_arm.zip"
    sha256 "17f8059c25ad957855f711ae8a69378584dd63954dea08b0f1a49e15c9461055"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.3/terraform-ls_0.38.3_linux_arm64.zip"
    sha256 "a79d1a9394a8dec68033a129b88c39a29a7cd6e49fe876dccdbd9bcb5fadb390"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
