# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.3/terraform-ls_0.36.3_darwin_amd64.zip"
    sha256 "3dfd12536e0c5ec5eb25362e3c092666effafc4c61f5630406ccf8f7715a0eb5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.3/terraform-ls_0.36.3_darwin_arm64.zip"
    sha256 "542ae3b59dc15d7404fd0d732480485ec3c68b258bb74e4e95d1239afca8b426"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.3/terraform-ls_0.36.3_linux_amd64.zip"
    sha256 "3cc5498dc37668ca005d957e85c8be9e5b2100fcfecb7f3d9b70cd8d69a5f654"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.3/terraform-ls_0.36.3_linux_arm.zip"
    sha256 "cf22cf963622bf227f12ff0a499da01522e08017bd7cf04598c83755cd64349c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.3/terraform-ls_0.36.3_linux_arm64.zip"
    sha256 "bbf70fc9ea4bf19c23b56286d98d029a303a6648cf5009762e68b90c5ab9114d"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
