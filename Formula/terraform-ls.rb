# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.3/terraform-ls_0.31.3_darwin_amd64.zip"
    sha256 "6683fea52eb054414703a40b4f34c4ab26034949d6f49b4947ab1dff943cd661"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.3/terraform-ls_0.31.3_darwin_arm64.zip"
    sha256 "62e64efa429c850f0ca0935af8047d1df3ec9156826d019003606032849d6558"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.3/terraform-ls_0.31.3_linux_amd64.zip"
    sha256 "c0d06c6545e46b20d1d694dd656540d89ad36f522e704f3ae6e283fa11d4a565"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.3/terraform-ls_0.31.3_linux_arm.zip"
    sha256 "8a9d925265b545d15966514046239fe36578fa2d387ad8137d918909ab92d7cc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.3/terraform-ls_0.31.3_linux_arm64.zip"
    sha256 "cdb938019eb78183ee197d504110aae66f6bf2e12d5a8576f4bc4f61f23066db"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
