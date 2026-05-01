# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.1/terraform_1.15.1_darwin_amd64.zip"
    sha256 "182fcb3d94e52daf904e412541d92cbe2a86bf28c0fb442da15ede2aa8c3fe76"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.1/terraform_1.15.1_darwin_arm64.zip"
    sha256 "01535b614be222dbd1344a8eb9162c3b54cc3b65c4212e8d4d9a2be72666ccff"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.1/terraform_1.15.1_linux_amd64.zip"
    sha256 "0921fee8c8435253ca49390a02109e906042e611a4e17f69e922261f5176c74f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.1/terraform_1.15.1_linux_arm.zip"
    sha256 "1921973745aeb4117a5af4dd74cbfa34ef357540ba048df3fa376bbad3a6692c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.1/terraform_1.15.1_linux_arm64.zip"
    sha256 "d0e5707a2ef8ff05dc546b8c0acee5b6f6968ba83c1208230364187a56480b42"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
