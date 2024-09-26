# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.28.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.28.0/sentinel_0.28.0_darwin_amd64.zip"
    sha256 "8701f04a26cff5b0a9e2ccc71230a548c1f698debb2f26a5eb30810201ef71e7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.28.0/sentinel_0.28.0_darwin_arm64.zip"
    sha256 "11b62577c5e62b902d6265dd4394fa156a7bff4793e2a4ecf5bb5d146a30737e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.28.0/sentinel_0.28.0_linux_amd64.zip"
    sha256 "4b92fd255af75995bd29f76861c8417e8e07c7666411511317997255f37824af"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.28.0/sentinel_0.28.0_linux_arm.zip"
    sha256 "18a80bfd599838d487470678fafaa7e4290dcb1d554e12bd1f8ca4c1b83772e0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.28.0/sentinel_0.28.0_linux_arm64.zip"
    sha256 "2a2c36fead760e8db608b941eff0367c71ef9b677bb419cf349e26fac4bf324b"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
