# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_darwin_amd64.zip"
    sha256 "5968872b07677829002d0a7ad34cf0c4cd02893a1c131e4ca30236442ceec445"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_darwin_arm64.zip"
    sha256 "6a54d2862c8244febe6077a1fc6e9e6cc4e65eee8169049e77ce08df233cf49a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_linux_amd64.zip"
    sha256 "12167574ae0deb219a1008bd4c15ff13dac7198d57870f48433d53fe2b0b28c4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_linux_arm.zip"
    sha256 "45d65148dcb75c2ddde093a0f1c222604470bf7584b9ab6cd36b99dad8ba9f1f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_linux_arm64.zip"
    sha256 "76668e7742ee8f815fe6de28c8b84507e6171b26966426c2eb8eea8e64fe2f33"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
