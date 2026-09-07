# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.1/terraform_1.16.1_darwin_amd64.zip"
    sha256 "3f165e7fabdb8ec44151494418efa1e8095c3f589ed8376a93578a96867a062c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.1/terraform_1.16.1_darwin_arm64.zip"
    sha256 "e22cba761ddbd4d218939b28715ab3af37aaf8a42efa41f7d75b2c3d73636060"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.1/terraform_1.16.1_linux_amd64.zip"
    sha256 "745d33b4b02b7980c62a38ec1beea24ee084ea8caf3f503c200554bd9a0cbe49"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.1/terraform_1.16.1_linux_arm.zip"
    sha256 "d60ad6dfa813ea89470ad1ea2f54776e5b4a6c1687161957158c718a60a14020"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.1/terraform_1.16.1_linux_arm64.zip"
    sha256 "423288a23ab024d42ac05c409972585f7ec0cf1be572b773ad952f9a1c41387d"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
