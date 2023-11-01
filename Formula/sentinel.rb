# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.23.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.23.1/sentinel_0.23.1_darwin_amd64.zip"
    sha256 "3b02b0ac37bdb0f135e08454f42a796f36b5ead9044abffd305c497c8ea4b396"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.23.1/sentinel_0.23.1_darwin_arm64.zip"
    sha256 "44ad8edc19ff7fb4f09b073e8cb1790cf2ac0a76e21c33c88edc48f15da21ca6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.23.1/sentinel_0.23.1_linux_amd64.zip"
    sha256 "f0fdab98f475a6327e8d1e777c0d575dc88cea81cdaadd632523d0167a283f64"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.23.1/sentinel_0.23.1_linux_arm.zip"
    sha256 "43b4b1cec6b10ff7e359ae8132b9150ce3ff9be547ba54e0dc071d5436978352"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.23.1/sentinel_0.23.1_linux_arm64.zip"
    sha256 "ade4b41272b810716b938c60433c4bc9af6021e5804e1aff38d59bf26965859a"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
