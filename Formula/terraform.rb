# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.0/terraform_1.15.0_darwin_amd64.zip"
    sha256 "e0871ff6d8a477ed07fdb5a4a4ca4325325e35c95b4930e7ccdeae242dba897d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.0/terraform_1.15.0_darwin_arm64.zip"
    sha256 "f2e52766a58f1e26e83200b4b4e5fe813c827786d20fa7aa01d9bcc1e9918b26"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.0/terraform_1.15.0_linux_amd64.zip"
    sha256 "dcd4b31225dd960404f744315c0c3823a7deeda43bca0256a17fc762092d7e1b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.0/terraform_1.15.0_linux_arm.zip"
    sha256 "9ac454828c9092cb0041b3fcf57a3af700f62ed94f2d5ccd2152d1596556473a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.0/terraform_1.15.0_linux_arm64.zip"
    sha256 "7d9b8ab81790771b5c872c06a8982bc25b66971928dccb244fe0a41e2451770a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
