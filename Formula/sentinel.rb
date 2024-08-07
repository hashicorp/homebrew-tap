# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.27.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.27.0/sentinel_0.27.0_darwin_amd64.zip"
    sha256 "4320500f1e97ce5f0a73b1541b173c4bf9046de068d7ef2321e3b2e9b7d3babd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.27.0/sentinel_0.27.0_darwin_arm64.zip"
    sha256 "05c2d372665517981816abab9a8eb81b6cce3f1e8e3cdae8da5fc8864c81bed1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.27.0/sentinel_0.27.0_linux_amd64.zip"
    sha256 "94b0287ff46f7edb375c845ff395d7aaf7b081392c8d21b7b01d58a8d69fdc21"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.27.0/sentinel_0.27.0_linux_arm.zip"
    sha256 "2d6ffbc4d15adb3ecb6161e7f970a4b5d5fa339c3eaf0197965a62f2f6440068"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.27.0/sentinel_0.27.0_linux_arm64.zip"
    sha256 "803a4c40b4ac525505c54bac47a413fe9e694d51c2fbc012292f7a5778ee0b7b"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
