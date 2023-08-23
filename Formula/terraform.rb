# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_darwin_amd64.zip"
    sha256 "a65a994111b9d1c7fca8fdb76470430a54e1367c6342507228954d944e82f9db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_darwin_arm64.zip"
    sha256 "c540d0ccbfb37884232dffd277c0ed08ab01ea7c05fe61b66951dddfc0dd802c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip"
    sha256 "3de5135eecbdb882c7c941920846cc63b0685209f9f8532c6fc1460d9c58e347"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_arm.zip"
    sha256 "7d282388327fc2226742a8dd0af127d4ed051c9e69cc9c0379ccb831dd13b574"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_arm64.zip"
    sha256 "e36dd4cbb4e4ccb96134993b36e99ef5cd5baf84f70615020dc00d91150bc277"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
