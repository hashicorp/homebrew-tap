# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.1/terraform_1.14.1_darwin_amd64.zip"
    sha256 "7760332d860343f83d68ee96ec99edffc6a2e95281041afffc851ced5df0f6f3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.1/terraform_1.14.1_darwin_arm64.zip"
    sha256 "4e98074e6b8a4b4f692780101d82cd9974c521e4cd6def4ab6299594619cda53"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.1/terraform_1.14.1_linux_amd64.zip"
    sha256 "9f53070ee626df9e157887c1d3f9af3d8107a1b654371cd99040629eed698b27"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.1/terraform_1.14.1_linux_arm.zip"
    sha256 "67873a5f35b7d55a57999b10a3ba83438dfd0003b76c81687248cd4105fa78d5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.1/terraform_1.14.1_linux_arm64.zip"
    sha256 "b2bb6aada17e2954d6b6a6f1e615884cacfd94b3879d8b4644f80b1c5020ac75"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
