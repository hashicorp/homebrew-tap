# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.5/terraform_1.15.5_darwin_amd64.zip"
    sha256 "3687d07c034b3e7deed5b072cd8ae2b34835bcb139baec3fc4f5fd534dabf5ed"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.5/terraform_1.15.5_darwin_arm64.zip"
    sha256 "01137660510005b918bba82154866fbeac4393163d8277c2abe861dfb5842c3c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.5/terraform_1.15.5_linux_amd64.zip"
    sha256 "702b2136af6728c8ff037f843dd2dbce2b7ad88786b7381d1d72aefa250f601c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.5/terraform_1.15.5_linux_arm.zip"
    sha256 "c7e8449432674fe642f469b9e7360258e2e34581312e4a95448abd6d8212622d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.5/terraform_1.15.5_linux_arm64.zip"
    sha256 "06e7b48de826146c6d9331ba35b13da12332d8392be30d1dd6b789ba4713fff0"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
