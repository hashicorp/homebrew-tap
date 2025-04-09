# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.11.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_darwin_amd64.zip"
    sha256 "a56d5002b9f7647291faccc3dd1a70350e60fb61e4c45037629508b8fdc2575b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_darwin_arm64.zip"
    sha256 "867e0808fa971217043e25b7a792b10720c79b1546f8a68479b74f138be73e18"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_linux_amd64.zip"
    sha256 "1ce994251c00281d6845f0f268637ba50c0005657eb3cf096b92f753b42ef4dc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_linux_arm.zip"
    sha256 "3cf072a049ab0178e9cbec47a14712ba7f38cc8ef061f3a7c0ff57b83d320edd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_linux_arm64.zip"
    sha256 "a43d1d0da9b9bab214a8305a39db0e40869572594ccf50c416a7756499143633"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
