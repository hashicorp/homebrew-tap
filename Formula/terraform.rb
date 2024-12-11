# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.2/terraform_1.10.2_darwin_amd64.zip"
    sha256 "68bd28cfe27b8720ec8d283c899a5275bedb53ea6d8f31291409464e476d4aa9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.2/terraform_1.10.2_darwin_arm64.zip"
    sha256 "7328910f45db254a59e4ccc6906ad3a595775a2aedd74395978f2a81c9890137"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.2/terraform_1.10.2_linux_amd64.zip"
    sha256 "c347b0223c12d315baf8c9cc69913d5dbeb4388e96abe17805be4da9b63b5cdd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.2/terraform_1.10.2_linux_arm.zip"
    sha256 "95fe2b491d371302d724501d83f872819fc33935423c3177efb3fb0f08d0f0f2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.2/terraform_1.10.2_linux_arm64.zip"
    sha256 "c170b97362ebf685c616be25f67e5fd7dc1014522595b0c55cd671bd3eb1d589"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
