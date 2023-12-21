# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.6"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/terraform/1.6.6/terraform_1.6.6_darwin_amd64.zip"
    sha256 "33376343c7e0279b674c1c8b8a31dc3174ac09dd796d32651cc5e3b98f220436"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/terraform/1.6.6/terraform_1.6.6_darwin_arm64.zip"
    sha256 "01e608fc04cf54869db687a212d60f3dc3d5c828298514857f9e29f8ac1354a9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip"
    sha256 "d117883fd98b960c5d0f012b0d4b21801e1aea985e26949c2d1ebb39af074f00"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/terraform/1.6.6/terraform_1.6.6_linux_arm.zip"
    sha256 "4a5342a4577d462d880bc392e808f453b101a48aaf383baf99383999a2254fc7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/terraform/1.6.6/terraform_1.6.6_linux_arm64.zip"
    sha256 "4066567f4ba031036d9b14c1edb85399aac1cfd6bbec89cdd8c26199adb2793b"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
