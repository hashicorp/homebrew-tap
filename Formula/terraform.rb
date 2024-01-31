# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_darwin_amd64.zip"
    sha256 "dad2fd54b3dda89b39978dcd27c8c62e13010efdc0507a04b6ad57257b57085e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_darwin_arm64.zip"
    sha256 "d8c7b8b1aa7f0b38a2e437d9c9e4e632b2b258e3bf48bb6de4626f3b0afea5e4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_amd64.zip"
    sha256 "e3965584b2347edd294ca97068af573654716abbb2ce5230d309692dab659267"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_arm.zip"
    sha256 "9fe80ff9f2637d44dad78a87cc6d97f80c205b43674384ec52ba7dcd7d1e7a44"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_arm64.zip"
    sha256 "1fe2b047ac8354aca92a8037b57d813f5e60b7b0ba02acbecb899d990663326e"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
