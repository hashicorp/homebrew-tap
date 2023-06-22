# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.22.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.22.1/sentinel_0.22.1_darwin_amd64.zip"
    sha256 "09b9908e0b8a3cefce7758aae95a1004374bfc0dfb5d13993b7ce3bbc3ed8b48"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.22.1/sentinel_0.22.1_darwin_arm64.zip"
    sha256 "81345bd34e86d59a56a40e57581cdd2c4116205e61e3bfb96e00b5302ef0da85"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.22.1/sentinel_0.22.1_linux_amd64.zip"
    sha256 "0a4a2b2baf46bfeb81d5137b2656b159ccc881487df3bebacd350ea48b53e76c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.22.1/sentinel_0.22.1_linux_arm.zip"
    sha256 "5674a301661c980abe9517852c254dad6809057f4f671422815b3691e3343387"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.22.1/sentinel_0.22.1_linux_arm64.zip"
    sha256 "30cae26f232ec12bc1312e3a017d5d60fd304ff8ced16594627bba7ac0942db3"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
