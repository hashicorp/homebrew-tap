# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.2/terraform_1.11.2_darwin_amd64.zip"
    sha256 "1c3d0e2a35667e4c45d16df0afe5001b36958b647ddf2276f60691a42b3eff60"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.11.2/terraform_1.11.2_darwin_arm64.zip"
    sha256 "e1de9cfa8f4b9cf31ce5f88fe4c55e1939cb2d2f23480b1520a37b596cd75414"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.2/terraform_1.11.2_linux_amd64.zip"
    sha256 "b94f7c5080196081ea5180e8512edd3c2037f28445ce3562cfb0adfd0aab64ca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.2/terraform_1.11.2_linux_arm.zip"
    sha256 "576a77c919e0bd8fc224b1b9090e96b1975c7bf1cee096312f2b68a121f1477c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.2/terraform_1.11.2_linux_arm64.zip"
    sha256 "1f162f947e346f75ac3f6ccfdf5e6910924839f688f0773de9a79bc2e0b4ca94"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
