# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_darwin_amd64.zip"
    sha256 "0303ed9d7e5a225fc2e6fa9bf76fc6574c0c0359f22d5dfc04bc8b3234444f7c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_darwin_arm64.zip"
    sha256 "75602d9ec491982ceabea813569579b2991093a4e0d76b7ca86ffd9b7a2a1d1e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip"
    sha256 "67541c1f6631befcc25b764028e5605e59234d4424e60a256518ee1e8dd50593"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_arm.zip"
    sha256 "5fc610f1554be7132a59542696094ad80a87ccdd3cac50a77f8ae4f7570bb0a4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_arm64.zip"
    sha256 "f0b4e092f2aa6de3324e5e4b5b51260ecf5e8c2f5335ff7a2ffdc4fb54a8922d"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
