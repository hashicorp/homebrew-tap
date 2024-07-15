# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.34.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.0/terraform-ls_0.34.0_darwin_amd64.zip"
    sha256 "dc97a2ff1b3fbd492a5896b1607bd6ede7e3a905fc1c0913ae9ca865af1c8120"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.34.0/terraform-ls_0.34.0_darwin_arm64.zip"
    sha256 "51e47932a17945482994ca0d12d8f418b892371319c6c17529c76fa850bf89dd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.0/terraform-ls_0.34.0_linux_amd64.zip"
    sha256 "cc68cb25c09f3d4f3e3a655a51d25ac9fff97a7ab04943f8e61ec4590ae651d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.0/terraform-ls_0.34.0_linux_arm.zip"
    sha256 "3d47e838e59970d13a3c25fcf7473580bc116233c7f2c59a89de987b1963fc28"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.0/terraform-ls_0.34.0_linux_arm64.zip"
    sha256 "3a1bdcbc069f1b7c7db9237b046d5785f2b5033503ecfa8adcaaa60ed27c237c"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
