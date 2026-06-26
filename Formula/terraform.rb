# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Infrastructure as code tool"
  homepage "https://www.terraform.io/"
  version "1.15.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.7/terraform_1.15.7_darwin_amd64.zip"
    sha256 "7f7a055e4d0c9dddb19cb14058fc885df139fdd4e987fffff6bf82993ac6a1a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.7/terraform_1.15.7_darwin_arm64.zip"
    sha256 "711791bf41365137a9a4adbf3e4c4a18dd7389d45c6a3039e3c6946bc750080e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.7/terraform_1.15.7_linux_amd64.zip"
    sha256 "73bbb8f5188ad75d4fb853fd100ae4d7e146ef7af7db18776109642fdb7759d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.7/terraform_1.15.7_linux_arm.zip"
    sha256 "be34a411ff07ffd286671e15d0f12aeeea403b64fec2f626990742f0984f37af"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.7/terraform_1.15.7_linux_arm64.zip"
    sha256 "7a9e92105ede978cf9049a2fbe53dfe67c6a8da4b4d7f613d89e7dd7c63ec40d"
  end

  def install
    bin.install "terraform"
  end

  test do
    system bin/"terraform", "--version"
  end
end
