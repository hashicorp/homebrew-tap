# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.26.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.1/sentinel_0.26.1_darwin_amd64.zip"
    sha256 "a8dfc234b5d65a3d085ac6b99cd32af943db3969163a711c71e3706944afbb6b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.26.1/sentinel_0.26.1_darwin_arm64.zip"
    sha256 "6facbfb121b2d7b9ea1438a06ae1f46ce3cbdae364a2784ab68b2d1d3f1329a4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.1/sentinel_0.26.1_linux_amd64.zip"
    sha256 "38728b4591917644aae29d56fdbd61bb660b74ad9abe06c60dd2cd40cce6befd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.1/sentinel_0.26.1_linux_arm.zip"
    sha256 "c0e417fc1f052015f45730bb66e843fdc5bdd4eb7ebbd7eada93fa9ce33afb73"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.1/sentinel_0.26.1_linux_arm64.zip"
    sha256 "3f47dc8f0a1f819572f03ef3615d15dc6b06e9232561cb9e5e19fae17d4b0751"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
