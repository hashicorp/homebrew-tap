# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_darwin_amd64.zip"
    sha256 "315e85f2c0de7d2b8862f9e7f0f78a093501be474b78ed0017aeef9cd902a8eb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_darwin_arm64.zip"
    sha256 "da2093ea34c0eed12ce6c2238b35e2caf71d3e26cdad3c55607c97be7ebe98ed"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_linux_amd64.zip"
    sha256 "d5f5aaba0f8ebff88ef0b23935872e154e2abf3172596261be834605ba3ba714"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_linux_arm.zip"
    sha256 "416990887ce03bdc518fd689f2640c0f34da2a12189595ca38db5ede371f4a1a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_linux_arm64.zip"
    sha256 "901821024261b851c46e2060d8849750a93dfe64bf8bcb85839f13325945f889"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
