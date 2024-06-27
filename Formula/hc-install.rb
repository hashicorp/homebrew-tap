# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hc-install/0.7.0/hc-install_0.7.0_darwin_amd64.zip"
    sha256 "eed428b46370cac7afb5088776eb2fc623eebd987601a61264e5fe591c6e91af"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hc-install/0.7.0/hc-install_0.7.0_darwin_arm64.zip"
    sha256 "0096f0cebbf3c3367401bdd82708a5ee296c728a953011467ca01ca7a9ba875b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hc-install/0.7.0/hc-install_0.7.0_linux_amd64.zip"
    sha256 "ddd6ef412fd60fa2465b03e18292c9e1d4f148c8037058a08dd96ee889ce243d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hc-install/0.7.0/hc-install_0.7.0_linux_arm.zip"
    sha256 "f32b546f0cd9152ccfb4d0024c8af7b75cbb6b6d31e473d382e5f87056bef829"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hc-install/0.7.0/hc-install_0.7.0_linux_arm64.zip"
    sha256 "1ab92ffb8b1fc389c8aaaa530aa86fb95e2d17a1b7d1d83a94ac6fb01a5bf759"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
