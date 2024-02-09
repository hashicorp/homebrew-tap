# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.3/hc-install_0.6.3_darwin_amd64.zip"
    sha256 "61113f2d20bc56000297d40086ff89f50a41c42d1bb04cbb60c3e84bcd774407"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.6.3/hc-install_0.6.3_darwin_arm64.zip"
    sha256 "aa4ff163d3fbdf4669836dc1db820c71c17fe89578222aac6b0407832a385745"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.3/hc-install_0.6.3_linux_amd64.zip"
    sha256 "0a66b03932d678ffd6193f37454450cc4f20f9e71603a3f3ae9be55f8c096413"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.3/hc-install_0.6.3_linux_arm.zip"
    sha256 "5849718a4ec1c8bffd4a95180ac2a4a9b2a7aec918c13266b5638b5ee8e8776b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.3/hc-install_0.6.3_linux_arm64.zip"
    sha256 "39554eaab77a28b75eea836c6e9e1d61a9d149fbbdb416ff919e43524fae4921"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
