# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_darwin_amd64.zip"
    sha256 "a7ff68a57ead3ca7ac0a4d055b5f08a2ce0474e371d935e75398fe7f864ba65e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_darwin_arm64.zip"
    sha256 "ea4dfb077425a179ee45e90daa255d21ef976867d347edcc4526f71370abbaf3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_linux_amd64.zip"
    sha256 "ea3020db6b53c25a4a84e40cdc36c1a86df26967d718219ab4c71b44435da81e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_linux_arm.zip"
    sha256 "829bf0965dbae58e88fc885159889908583220b5fff4ca8ff34326534a824dbd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_linux_arm64.zip"
    sha256 "b92d8245c67d4f7193245bc9d534048a63520302b6edb3c7764277b00c96ed31"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
