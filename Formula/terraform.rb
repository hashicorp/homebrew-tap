# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_darwin_amd64.zip"
    sha256 "89aace89147ca00d5200282aa766866e32268e191d97aceca7629fc2379aaab9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_darwin_arm64.zip"
    sha256 "27834a6450c4046af812dcc3faff3c0c56c8c499ca9990d7cd43ef7f844077ed"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip"
    sha256 "265d28a1a6dd81bdd5822eba55663613b7a51c582d663f9417f8777905d39002"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_arm.zip"
    sha256 "0873b3f09a4710ab8d722e4977f99698b05ea94fef25a16cf5a9302421f45d38"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_arm64.zip"
    sha256 "dfc825bd488679163a2768f3c87261ce43b4747720a6cc4e2a63935961ce4582"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
