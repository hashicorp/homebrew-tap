# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.23.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.23.0/sentinel_0.23.0_darwin_amd64.zip"
    sha256 "8cdd02980e47d0bbc2981b889b43a07b3af44bacf3825ad0f993ac2f8428c3c2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.23.0/sentinel_0.23.0_darwin_arm64.zip"
    sha256 "bc5786b938468c16ba973fa076f079d5ee46eb306aadaedb17b8b45427d2957b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.23.0/sentinel_0.23.0_linux_amd64.zip"
    sha256 "071411fb60465db5f654a8ce822ff5d7f08c301e1086790bd62de9aa72c7bc16"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.23.0/sentinel_0.23.0_linux_arm.zip"
    sha256 "a329d9b5087bb2d41b50a5dbc06a038458741e4257a7cc4fb9670f92bd2ad707"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.23.0/sentinel_0.23.0_linux_arm64.zip"
    sha256 "ac7f8a8886acc895892bb02a4f84873ebcd1f2e11c8a6a38eb1a3bf8f315c56a"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
