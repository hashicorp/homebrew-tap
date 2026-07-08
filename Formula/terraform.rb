# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_darwin_amd64.zip"
    sha256 "e2e812e783771159bf758fd4e55d6dc9bb08f63e2af2c63d212721807a02c5dc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_darwin_arm64.zip"
    sha256 "f210110c5698b94d803a7a63cdb0251b5455c150841478808e2bbb343f95ed68"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_linux_amd64.zip"
    sha256 "d25ce7b6902013ad905db3d2eab0be4cd905887fe88b81a6171b8d5503c31f3d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_linux_arm.zip"
    sha256 "9e6964abf11a84db1fa84d67adbfb9caf52ef5d03fdc1beb122c66129b9337d4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_linux_arm64.zip"
    sha256 "8891e9dcedc9e3b8950bc6af9d4d8af1f4cfade3062f53b9dc403a89f6ce8c9c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
