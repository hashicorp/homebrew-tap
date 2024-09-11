# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.0/hc-install_0.9.0_darwin_amd64.zip"
    sha256 "56e567f0eb4bbf1bf4730ecf7547a52adb40deb0d13f36613e4d39acd8fb9ac2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.9.0/hc-install_0.9.0_darwin_arm64.zip"
    sha256 "46d91ec8690516addf67c97286494f0361a87092e9bc431931f5f50791342216"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.0/hc-install_0.9.0_linux_amd64.zip"
    sha256 "e31cba590d65c090d865a69e7a08b7918fa71135246b855a2b46140b5b7fcd36"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.0/hc-install_0.9.0_linux_arm.zip"
    sha256 "7e48775a4f752d6562a29327809a99defc7fa01c8dec1ca1015a702e72b13e94"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.0/hc-install_0.9.0_linux_arm64.zip"
    sha256 "8141240d28ea335366202166240aad310b1063d88568c69aa78008af888826fa"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
