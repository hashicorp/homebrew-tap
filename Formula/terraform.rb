# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_darwin_amd64.zip"
    sha256 "b69196c831d6315b6e79178c96a66365d724cf4b922ad4a9763cd970aeeecd45"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_darwin_arm64.zip"
    sha256 "b7701c42a9b69524cfe79f0928d48ec4d648bc5e08794df12e8b41b56a0a395c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip"
    sha256 "ab1358e73a81096bbe04201ef403a32e0765c5f6e360692d170d32d0889a4871"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_arm.zip"
    sha256 "94d3fb0bd6df8de2cfb24781344036a15e9de8ee148b3cf1bc870c9ea69c88d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_arm64.zip"
    sha256 "f5c0a49b482c008a6afd2248c08ca919e599c1154a850ff94809f4a85c86eb3b"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
