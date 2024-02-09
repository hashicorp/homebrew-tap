# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.24.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.3/sentinel_0.24.3_darwin_amd64.zip"
    sha256 "46879e2948eaaf2095bb1afb5fa9744adb3d7f8b77f5e742dac23159cca3aae8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.24.3/sentinel_0.24.3_darwin_arm64.zip"
    sha256 "5728ea1d737f4bb6c3e54e1591e57a189f3cd2107e3d319cc4924cbeb2568ab8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.3/sentinel_0.24.3_linux_amd64.zip"
    sha256 "fd9025bace264ffd003d57c101b7439ca970132e5f5a40731eff52089e6e428b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.3/sentinel_0.24.3_linux_arm.zip"
    sha256 "ddbcb738baa2cf68d012aca9aa2c6d117e1bc3dc1df67d43b9d85b48c77709b4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.3/sentinel_0.24.3_linux_arm64.zip"
    sha256 "14fc50da323d8cdb2d1e8d18fd768e0bb62322543ae33c7117ca1c20d35b92af"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
