# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_darwin_amd64.zip"
    sha256 "a4f695e64948ad66fe05e2f589cfe5221b8597ff16173ebed8055d3a90aaa739"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_darwin_arm64.zip"
    sha256 "2622426fd6e8483db6d62605f52ea6eddb0e88a09e8cea1c24b9310879490227"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip"
    sha256 "4ff78474d0407ba6e8c3fb9ef798f2822326d121e045577f80e2a637ec33f553"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_arm.zip"
    sha256 "26ff2b06d13272999d56c8ca57446d51d6fdba483e385f401ad26cebd44b196a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_arm64.zip"
    sha256 "5fd3c4ee4cf23f79641f77006d29544b41fbcde5d22202566322266e6fca2607"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
