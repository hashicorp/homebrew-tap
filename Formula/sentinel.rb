# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.29.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.29.0/sentinel_0.29.0_darwin_amd64.zip"
    sha256 "a23f411dbb8bebea072d59ca934d093045c19e30ee61435be953d9f8237072ad"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.29.0/sentinel_0.29.0_darwin_arm64.zip"
    sha256 "c02100f64904864b834d5dd609644c3b0373d2934922c71186f4a64863e26d94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.29.0/sentinel_0.29.0_linux_amd64.zip"
    sha256 "2356a9fe338d13d68d971a8c139c948c2d18f74b04b43945e09f78324274c708"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.29.0/sentinel_0.29.0_linux_arm.zip"
    sha256 "89bdfdaba1f35e50338665f355f228c24c777bb08320604ed80c5abc5192b67e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.29.0/sentinel_0.29.0_linux_arm64.zip"
    sha256 "09694400928c71594cef7e15618770268de0d317a1eb39eef2c4fca5e6d847c0"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
