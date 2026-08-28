# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.9/terraform_1.15.9_darwin_amd64.zip"
    sha256 "3e97c499fac8074adfa3760300662a0158f2fd325144965dd0028deec4086c6b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.9/terraform_1.15.9_darwin_arm64.zip"
    sha256 "05b27586a5d7d84105690ecccc7edbbf48bc3d6d577745cb61f163ba990adf4f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.9/terraform_1.15.9_linux_amd64.zip"
    sha256 "76edd0b22d2f27d3d2e097cd793209646f719cf60f02ff3af626b07361137da1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.9/terraform_1.15.9_linux_arm.zip"
    sha256 "9b7a67a2ff2db4768a697db96fa5859ae4c9490f7c4f365fa8b9b40ec7b870ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.9/terraform_1.15.9_linux_arm64.zip"
    sha256 "0afa6c29f61ca5ea270e950e43e50ecf2418b598507bf580e8ae76e1e6699b19"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
