# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_darwin_amd64.zip"
    sha256 "a5ecd11c8ed9b6c5182a84bce9c3c9c092f86916cf117bca855991853502af94"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_darwin_arm64.zip"
    sha256 "444e5565806041d9899a9ba50549840eaa2a2cb7d5b59bb08c5874f92bc4963d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_amd64.zip"
    sha256 "5ce4e0fc73d42b79f26ebb8c8d192bdbcff75bdc44e3d66895a48945b6ff5d48"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_arm.zip"
    sha256 "70191f5a5a5f3be0a602de48b85e38528651402846ea29e3d7f60a79a54e8391"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_arm64.zip"
    sha256 "776c78281c1b517d1e2d9e78b2e60900b8ef9ecd51c4a5d2ffa68f66fea35dd2"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
