# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_darwin_amd64.zip"
    sha256 "27aca7551143d98be83b780fa0040b359c43a6704bdd49514ea582d942752718"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_darwin_arm64.zip"
    sha256 "6d68b0e1c0eab5f525f395ddaee360e2eccddff49c2af37d132e8c045b5001c5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip"
    sha256 "16d9c05137ecf7f427a8cfa14ca9e7c0e73cb339f2c88ee368824ac7b4d077ea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_arm.zip"
    sha256 "f5312e7dd830f930718662277584f4ed9ab6740b765977cc7e386ffe451457f5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_arm64.zip"
    sha256 "c087c129891816109296738d2bf83d46fdca110825a308d5192f330e80dad71a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
