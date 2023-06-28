# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_darwin_amd64.zip"
    sha256 "0484b5c7d5daa17cfff476f29b027398d805c00a8c276f884734b4c6fadd15ec"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_darwin_arm64.zip"
    sha256 "75c5632f221adbba38d569bdaeb6c3cb90b7f82e26b01e39b3b7e1c16bb0e4d4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_linux_amd64.zip"
    sha256 "781ffe0c8888d35b3f5bd0481e951cebe9964b9cfcb27e352f22687975401bcd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_linux_arm.zip"
    sha256 "6a3229d9ebe8bfe219568ca7e060ced26e6e568c419a97601f2d9a756b998dbb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_linux_arm64.zip"
    sha256 "c39a081830f708fa9e50e5fe1462525ded4de1b4308dcf91f64914d6f4e988b3"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
