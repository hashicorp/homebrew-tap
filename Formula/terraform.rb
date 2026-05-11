# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.2/terraform_1.15.2_darwin_amd64.zip"
    sha256 "2bb701bc2db93ed39613df4f4e033ec4c2de9eba1c036d9a2f62cffc988af066"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.2/terraform_1.15.2_darwin_arm64.zip"
    sha256 "4204bc3450418a7ce423e58451b053e5daed625ad6c6a15de98bc09345269f99"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.2/terraform_1.15.2_linux_amd64.zip"
    sha256 "c56ff2bc7e6ce9b3879a50392b03c2ea074b47688bf503ff966c87fb01b2aab8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.2/terraform_1.15.2_linux_arm.zip"
    sha256 "6e0f8ab581563adb707587ae5ae58ca1ee210c7f719795671d6f922bcb76d708"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.2/terraform_1.15.2_linux_arm64.zip"
    sha256 "cf27657e96bbdc6116f4c16a0c801d36ae6410d7210183a520ac6b2198fb723e"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
