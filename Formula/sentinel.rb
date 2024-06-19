# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.26.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.2/sentinel_0.26.2_darwin_amd64.zip"
    sha256 "ac93f0f656d676ad5315bb10bd322834e4c6e35ec2b181faeb3a69abd3afde97"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.26.2/sentinel_0.26.2_darwin_arm64.zip"
    sha256 "5492f9b07aec1a46d077da4b3c9240b0d0203e9c3a691aba5525698d57f066fd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.2/sentinel_0.26.2_linux_amd64.zip"
    sha256 "2079f261b7e0c330c1150006243a7bc320b4fd50377c8136e44341cd0a89462b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.2/sentinel_0.26.2_linux_arm.zip"
    sha256 "12bd7d047950b6523543a93be3457a367699893cdcf3edb9bd22ec2e421b8a71"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.2/sentinel_0.26.2_linux_arm64.zip"
    sha256 "7c346ac370a7cefe53eb314a18312435f34483811be9afec65af31e0a033c7e2"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
