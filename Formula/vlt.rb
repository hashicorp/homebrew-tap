# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.1.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.7/vlt_0.1.7_darwin_amd64.zip"
    sha256 "56ee68696f7f043cf4f7cdf4e01a8606d554c59afa03e080d8bd1c09d718a68d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.1.7/vlt_0.1.7_darwin_arm64.zip"
    sha256 "9bb44491547da1431403cf1f908c9646c3167e93ea430f28b42cec8eef76b7bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.7/vlt_0.1.7_linux_amd64.zip"
    sha256 "adb4ae02faacb34ab4eedaf2587bb46773fbb11524cd8ebca6f0239a972d9832"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.7/vlt_0.1.7_linux_arm.zip"
    sha256 "32ae01c51ead0e3f21e9a09312eba0416eb533dff7a46ee1362f0fefb982d6ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.7/vlt_0.1.7_linux_arm64.zip"
    sha256 "a3089a6e2da60bc9a600f4b26b6ecd894dde5c835c81e349064ffa90df9f77b9"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
