# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.13.1/packer_1.13.1_darwin_amd64.zip"
    sha256 "0da13eb3a0a1a64ade9a2ca3f94fdf0937ba3cd7eedfa095555c2b12695f9688"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.13.1/packer_1.13.1_darwin_arm64.zip"
    sha256 "bff9fb06a0d13abb2eda9e9cab3f721d196cc9e69b720f220af61d068f02a4de"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.13.1/packer_1.13.1_linux_amd64.zip"
    sha256 "c3401da41a47d51e2ef3e78a76f625c753b6f19e81681e4cdc3bc6e6f8c699c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.13.1/packer_1.13.1_linux_arm.zip"
    sha256 "a5b5229937d0ffd45cb66cf4ef9b9b462304b96411070064fc9d0cc58a57fb7a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.13.1/packer_1.13.1_linux_arm64.zip"
    sha256 "41685f9b1326fa433d551afc160b7930490ec9f12cf975943e3cb2adca650b58"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
