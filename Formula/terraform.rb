# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.4/terraform_1.14.4_darwin_amd64.zip"
    sha256 "367dfc3fd689db10817f96cede1f737c88300f34e5a783c90cb9874973031832"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.4/terraform_1.14.4_darwin_arm64.zip"
    sha256 "dc4ee56edfde4fb6d578783292b5fa126d624803aa9326d03da5466ef59d4dbd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.4/terraform_1.14.4_linux_amd64.zip"
    sha256 "4a24b18865d9419ba7882567cb7429dd1525b3e2029a9e38f612d476ba8c3dea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.4/terraform_1.14.4_linux_arm.zip"
    sha256 "53f0c649628ccb2ba466faa90306f65143e3a84b86085f1a285039fec03a77a1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.4/terraform_1.14.4_linux_arm64.zip"
    sha256 "dcbc9d4b9fcd47e76ae194d5d569bfbf9f15bf1c59ca692aff6d2a92eb8e8994"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
