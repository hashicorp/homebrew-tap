# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_darwin_amd64.zip"
    sha256 "d23c34dbd84884913a939f34abfc46065f2794f43e1614d0f7b70af4e206ac8a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_darwin_arm64.zip"
    sha256 "440865e068811f5573b900b6e9822e266c1e6074eb31daccc2537d1cf24a0dd7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_linux_amd64.zip"
    sha256 "6e9b2cc741875ab906d800af3134b076489f049565e0a1dbdb6deacd91f5054c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_linux_arm.zip"
    sha256 "9755b846b0a57076bed20d1a5fdbddd4f2f74d49ca6f0fc7980b4a7655c424ba"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_linux_arm64.zip"
    sha256 "ada5a330c09456df091bd2449c80884e3e368b80978d5849c940129047f43d1a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
