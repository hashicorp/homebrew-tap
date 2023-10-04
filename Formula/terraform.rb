# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_darwin_amd64.zip"
    sha256 "8993da0dac34cc8ba9b88f925c17d54ec490bea6d18f6f49b07d535e6264a608"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_darwin_arm64.zip"
    sha256 "aaf3f6639c9fd3864059955a36ccdadd7b54bab681fbe760525548a53cc0c7ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip"
    sha256 "0ddc3f21786026e1f8522ba0f5c6ed27a3c8cc56bfac91e342c1f578f8af44a8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_arm.zip"
    sha256 "92775f32d6266807685a03c787711377aaebaae115afc18f0c0440e2e7db5fea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_arm64.zip"
    sha256 "413006af67285f158df9e7e2ce1faf4460fd68aa7de612f550aa0e8d70d62e60"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
