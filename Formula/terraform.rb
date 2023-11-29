# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_darwin_amd64.zip"
    sha256 "6595f56181b073d564a5f94510d4a40dab39cc6543e6a2c9825f785a48ddaf51"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_darwin_arm64.zip"
    sha256 "5c66fdc6adb6e7aa383b0979b1228c7c7b8d0b7d60989a13993ee8043b756883"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip"
    sha256 "f6404dc264aff75fc1b776670c1abf732cfed3d4a1ce49b64bc5b5d116fe87d5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_arm.zip"
    sha256 "abc220cef21d0937878e42de5c3085bdd8b7ca2e135163bfeeac1881da148a4b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_arm64.zip"
    sha256 "bad7aed9df3609599793f8c1f2df3ea6a5b4bf663813023989b9ee35632b6754"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
