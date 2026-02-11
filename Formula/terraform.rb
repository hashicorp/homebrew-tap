# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_darwin_amd64.zip"
    sha256 "16efdfb151b49a65fd9b47e30577a6a7012e6edabd2a034445fe7ddf74733ffb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_darwin_arm64.zip"
    sha256 "132e740024635494900e561014cf4d111a66c6454fcd548dee5cc4cf873ee52f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_linux_amd64.zip"
    sha256 "ac21c2b9dcd115711f540cbd27ead0596bb4288a917cb56dfa9b25edb3eb6280"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_linux_arm.zip"
    sha256 "5fe9b93bf93bca52ad20dc95114f269f3bf33b554d7eb5f515f8763f74dc2884"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_linux_arm64.zip"
    sha256 "7dbd03721e8f933ba0426fc292d7a6549a61c0cb1c7c821729f6982c7bce4b05"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
