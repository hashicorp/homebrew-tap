# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Levant < Formula
  desc "Levant"
  homepage "https://github.com/hashicorp/levant"
  version "0.3.3"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/levant/0.3.3/levant_0.3.3_darwin_amd64.zip"
    sha256 "da1f7b45a5a10f8d2387ac40aac7eb52c3dbe6606e9948b51ee0efb82f88c165"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/levant/0.3.3/levant_0.3.3_darwin_arm64.zip"
    sha256 "aeb4e4a5bca4be48ba8706d671d50893f2db439cf61f302162293a4362bddeb0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/levant/0.3.3/levant_0.3.3_linux_amd64.zip"
    sha256 "630c4c0499fdc0b904be22905e18dcd81350f8011ab1494b23f20d06f192d462"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/levant/0.3.3/levant_0.3.3_linux_arm64.zip"
    sha256 "e2e3bf5aed271d848d8aac86b4649594b7f9aa1e11aa4612f5b571f97598bba4"
  end

  conflicts_with "levant"

  def install
    bin.install "levant"
  end

  test do
    system "#{bin}/levant --version"
  end
end
