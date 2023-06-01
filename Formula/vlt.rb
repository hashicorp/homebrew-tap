# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.1.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.6/vlt_0.1.6_darwin_amd64.zip"
    sha256 "b8ec74afe5402928dda12d0a566025d6b06903c624ef3fed5df510c06483465c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.1.6/vlt_0.1.6_darwin_arm64.zip"
    sha256 "8cf675c789b5296307974a75cb600f773f2b92689b161b5ab7f0fb4d3043b458"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.6/vlt_0.1.6_linux_amd64.zip"
    sha256 "7b9c537e36aeff8b2289d016e8a079a275e1206876a2c37e8b9f54a2de919f5a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.6/vlt_0.1.6_linux_arm.zip"
    sha256 "093fb465a8de3f79357411faee1b61ae2d4a2bce2a5aaf1b26c53f8b8b0c5ed9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.6/vlt_0.1.6_linux_arm64.zip"
    sha256 "d7b5c21628f90ff33b3d4b23ddddcbc57fa4d9c893b16af2361b462e20ff19fb"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
