# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.2/terraform_1.13.2_darwin_amd64.zip"
    sha256 "6eab5472d9afd510b6f4fb43ebe74e098821dfaab50cf5fcfb696082f73f5328"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.13.2/terraform_1.13.2_darwin_arm64.zip"
    sha256 "150c55bd7459ee1216d994307b3b84b3e44ad57354f62357d792e4cbb8b2f64b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.2/terraform_1.13.2_linux_amd64.zip"
    sha256 "b7554c87f36dbb2231d54c4277cbbddf58ae8ba916fa97461564836a2c4954c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.2/terraform_1.13.2_linux_arm.zip"
    sha256 "6b61e2791d09a5d07adfbbc0f4393c3ad0daff76a68b5bd24e6889ab91aecc39"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.2/terraform_1.13.2_linux_arm64.zip"
    sha256 "9b3814d36b5b22d9bc7a2856a676770c7b2597b8df025004054354226865ced6"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
