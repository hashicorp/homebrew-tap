# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_darwin_amd64.zip"
    sha256 "4164db242076c7e99ac6aec67bc42b366925b97267e3883edaca4e4e408b082e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_darwin_arm64.zip"
    sha256 "51910553dae21dab7f5f55912129602fd902e68a6b6d84b326a556a3e140b98b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_amd64.zip"
    sha256 "0566a24f5332098b15716ebc394be503f4094acba5ba529bf5eb0698ed5e2a90"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_arm.zip"
    sha256 "c446cbafed29342c9d7d71b8ce977cfc8be45352d9172dab50abac1da3cf0b89"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_arm64.zip"
    sha256 "0ca5d6977c7c46bfa4bbe030030b911e897cf0cb72bff5525fb76c10f1c3409a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
