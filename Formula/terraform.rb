# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_darwin_amd64.zip"
    sha256 "263c2a63dd6e11b4f5d062262ff8cbf8fad56460af69e5493f22f495b35c4ab5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_darwin_arm64.zip"
    sha256 "1daedd25138836756fb3eb5cf1a85ab59d06f385a4e3b3bebd8151185bdea5cb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_linux_amd64.zip"
    sha256 "4b05f4848d365597cf7ac5b59334c62a16b3bb7b524586578ee45ba823b6758b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_linux_arm.zip"
    sha256 "8209739371bad76287e04aedd2a3b1b6bcf5c16ae9ba8adbb93dc3d7346df9f1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.0/terraform_1.10.0_linux_arm64.zip"
    sha256 "e12fad357bcff9537e904a7821529206c2c8fb48f700b670c25d6deddbb65d05"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
