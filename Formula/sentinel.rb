# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.26.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.3/sentinel_0.26.3_darwin_amd64.zip"
    sha256 "2f9908bcdf99de07c08a59ef05d79c1c5457121b358e106848a560d9d513f89c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.26.3/sentinel_0.26.3_darwin_arm64.zip"
    sha256 "3dd675e4cdcabae6cf1d910ccc627d96516870a0e301d77dae67b2d3be21d8dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.3/sentinel_0.26.3_linux_amd64.zip"
    sha256 "4775316d5024c120097a3744e232bff484a8b1eb4d22fa5d1eb97c5e6c2f0820"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.3/sentinel_0.26.3_linux_arm.zip"
    sha256 "b8920f55f16e2466ea6963f91cc3a99bc83b69866d0f014502b0b5a1f6ea395b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.3/sentinel_0.26.3_linux_arm64.zip"
    sha256 "9f696fea43117d1932efa9ee138fde1b0df95d8c50762e69d02f9877d5545db1"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
