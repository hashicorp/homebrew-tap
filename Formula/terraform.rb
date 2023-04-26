# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_darwin_amd64.zip"
    sha256 "5d8332994b86411b049391d31ad1a0785dfb470db8b9c50617de28ddb5d1f25d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_darwin_arm64.zip"
    sha256 "30a2f87298ff9f299452119bd14afaa8d5b000c572f62fa64baf432e35d9dec1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip"
    sha256 "e079db1a8945e39b1f8ba4e513946b3ab9f32bd5a2bdf19b9b186d22c5a3d53b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_arm.zip"
    sha256 "e03fa047d5cd093929c89e261ee0852968c92097e3d575f7b56b1cb3720c82fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_arm64.zip"
    sha256 "b38f5db944ac4942f11ceea465a91e365b0636febd9998c110fbbe95d61c3b26"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
