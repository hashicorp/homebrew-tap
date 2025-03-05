# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.11.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_darwin_amd64.zip"
    sha256 "5a07ae8d246d3cca5fb32ec988cc78824ddc03a166ba175e5c7d002f42f8ffa7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_darwin_arm64.zip"
    sha256 "94edba167cb2f6428fe849688af67b2a91696be4dc1152b6ac94487d826ec8e6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_linux_amd64.zip"
    sha256 "1af58f77958186227bce9ae4d9b08e004fb0902c7a6bdc813cdbab88739f9316"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_linux_arm.zip"
    sha256 "fa872490ead64fbd55c6f6bff5b229a32eaff58fd038ebc1bb9d88efcab043a5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.1/terraform_1.11.1_linux_arm64.zip"
    sha256 "35ebb4f6a34cec8a5f7983d6d7e25e115f4b8958ac13bd306fe76dcec80967ec"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
