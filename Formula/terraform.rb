# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_darwin_amd64.zip"
    sha256 "469f19fb58ed6f67abc858f1d1a20a2fdb1fadda8eaa0f766da1c8acd1518cb0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_darwin_arm64.zip"
    sha256 "e9004e245b3e56bff9c7a6c572295d710f6ce4fc72e3910e99519ebdcb46d1bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_linux_amd64.zip"
    sha256 "e8bbcefea8015156e04e2a325cde37a0b2fb761728bda548e2fe3b8ad7c18c96"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_linux_arm.zip"
    sha256 "48b8c04e472ce05c6df945513c0014335fa52117fba602903ade89f571b2ec09"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_linux_arm64.zip"
    sha256 "04f88ee8924db27c0e26c379721965273c80c9b6a94bc5d8d8048a69163952ba"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
