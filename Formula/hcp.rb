# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.6.0/hcp_0.6.0_darwin_amd64.zip"
    sha256 "59a491e305566c81bd7df50e24691ab12d372fe0cf0d95ae38640529d332aa2b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.6.0/hcp_0.6.0_darwin_arm64.zip"
    sha256 "ccf798d7937a8f04dc5192cd03af42a9f2c8af8c37dfafc1838fe7df2033214f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.6.0/hcp_0.6.0_linux_amd64.zip"
    sha256 "5ed560844949bfef732e0b920b7ae72ce82fdf7718d81474472421e0775eaa20"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.6.0/hcp_0.6.0_linux_arm.zip"
    sha256 "0fdb22330ee27a3208d785653638cced28319555ea9de0f3862681998ea34e7b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.6.0/hcp_0.6.0_linux_arm64.zip"
    sha256 "7aa667ca370de7c144700a0aae8b2bbba82695c4bf2559b39b029abeca45f0c6"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
