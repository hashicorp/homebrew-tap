# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.14.0/envconsul_0.14.0_darwin_amd64.zip"
    sha256 "068c5f0850ce8a29ab1e37a02d79e5d8317bcdf1e1e8dd8de38f7f62061a18d5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.14.0/envconsul_0.14.0_darwin_arm64.zip"
    sha256 "5351b1230860f6e2f6398d49836ea2a7245dcbcc3eee51125c523107d5b5ef39"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.14.0/envconsul_0.14.0_linux_amd64.zip"
    sha256 "d7b1d4395ce9b465b6e635c9bd8ec70b852de5553fa0b9ecd07829323cf9ead1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.14.0/envconsul_0.14.0_linux_arm.zip"
    sha256 "3812da750ff2e63293326c46b04f778a901f0ca6971645428eae052b505b0f97"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.14.0/envconsul_0.14.0_linux_arm64.zip"
    sha256 "ef2216db609508478a10826125ec60af8730d6b83bb9f2e5d4ffa277aded3033"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
