# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_darwin_amd64.zip"
    sha256 "621a2ef8d0ca4e5bb613632983b6b2cd53d542978117df779ac363422ce6802d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_darwin_arm64.zip"
    sha256 "7c23ffbeba15c38ce547e62ba4ffbb2c3620cf5b38bf9fa8037cfa81544d1150"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_amd64.zip"
    sha256 "2bac080244845ebd434baf5e8557bd06d53b3c8bc01b7e496b390a56cb40ac5c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_arm.zip"
    sha256 "ee7f75ed10e6f37e93d6ea23728d724def42082af909c7ab3886c19d0cfa9652"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_arm64.zip"
    sha256 "33094b8c677460e7c6496a89770ae702bb8d9c6613d4a8485897da006d1919b5"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
