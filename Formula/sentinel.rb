# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.25.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.25.1/sentinel_0.25.1_darwin_amd64.zip"
    sha256 "174760d764366a2d7f96b6e7e1dc2733d3f6739c58580691736c326db53c87d5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.25.1/sentinel_0.25.1_darwin_arm64.zip"
    sha256 "0d959cc359e9cbfd2e6fb50f43f7a4e7edcf1df4d066cee83711550bf22ce585"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.25.1/sentinel_0.25.1_linux_amd64.zip"
    sha256 "bd365251eba121e4c6696d7488151ee0df862fa2629f04d822d47107d3ba1c89"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.25.1/sentinel_0.25.1_linux_arm.zip"
    sha256 "c103a3d260edc6e9612811b52d506da929934069b860711f3a86f308216dd9ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.25.1/sentinel_0.25.1_linux_arm64.zip"
    sha256 "c4ab948c62d818922c7ba9e639810c5d6d3ffbbebc3a95bc39dfd5be51c3a3d2"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
