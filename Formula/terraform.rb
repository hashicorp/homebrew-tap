# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.3/terraform_1.15.3_darwin_amd64.zip"
    sha256 "448e89a455e854941bd7e1396ba6ca46e92dd7e0ed1cc11d4da4cab637606d8a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.3/terraform_1.15.3_darwin_arm64.zip"
    sha256 "b97101c62c11eebd176e83cd42a313336200d54fdd18ce7770f65a5bfb0ab098"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.3/terraform_1.15.3_linux_amd64.zip"
    sha256 "c3d4b579064745a5f7e918125db23b12ba52a8a7287adb9f32c49d637e02e3bf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.3/terraform_1.15.3_linux_arm.zip"
    sha256 "17e75bf2abb1dc5283e12855a30eb68c4feb14794a94d4cae912f2245115f377"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.3/terraform_1.15.3_linux_arm64.zip"
    sha256 "9824eb010b835b2c872440a337a69acfa1782d36c24d3c09fe5defe75defc511"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
