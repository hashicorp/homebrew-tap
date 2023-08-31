# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.0/hc-install_0.6.0_darwin_amd64.zip"
    sha256 "fd625aa0e62d44e2fb7069375a1d4138f73b7fd721e65e86b14a616f6d64b99f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.6.0/hc-install_0.6.0_darwin_arm64.zip"
    sha256 "666795317854feaea704d3f9e7f26f5a0bac9be1c859f5dbe8ac7c931aa86b94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.0/hc-install_0.6.0_linux_amd64.zip"
    sha256 "40c4d5fac7d21fca889c9e6a469f6092a8f4f9854adb49b5eef9bbd63c0d15ba"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.0/hc-install_0.6.0_linux_arm.zip"
    sha256 "6f510d9f490072270b2302b22b75ad8aa6f76bb67834b74dd07b6a0a8595e763"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.0/hc-install_0.6.0_linux_arm64.zip"
    sha256 "d961be9ef6dbe4f20f8d7b2ddf18d92773d8075554ce95813e071ef9a908ccb2"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
