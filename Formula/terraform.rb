# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_darwin_amd64.zip"
    sha256 "5b49e6a6fcd00cafccaad0ae869f218e862023c5a904286460cc0fe42bfb3eab"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_darwin_arm64.zip"
    sha256 "f106632f6f7df76587d7a194b1ceb40b029567861ee8af6baade3cdebce475f7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_amd64.zip"
    sha256 "f2c90fb1efb2ad411519d1d3ccbaee7489a60e3147f2206fdb824fb35fac9c1c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_arm.zip"
    sha256 "bd71d88f37e5a61bb5070d452da5c1c6fad702256b972e499dc8bae8c705131f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_arm64.zip"
    sha256 "625eda48078ab7df18e697909aa6092962ce303a48bf6cf853c6470bb90b99df"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
