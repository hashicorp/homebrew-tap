# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.26.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.0/sentinel_0.26.0_darwin_amd64.zip"
    sha256 "26a991182429cef43cb8439e945dc9f50f84e818bb028977787db4fa9648f244"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.26.0/sentinel_0.26.0_darwin_arm64.zip"
    sha256 "85f8a352e4ec1bc1c40b0b7110b022f36939a1e606a57501dbf252ce36f8b4e2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.26.0/sentinel_0.26.0_linux_amd64.zip"
    sha256 "24c6aa7077a46e94f9eb94c3317fcf41d3447d39198accf5f988385dda1d79e8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.0/sentinel_0.26.0_linux_arm.zip"
    sha256 "06b7198d4f30144336467d57fdebf8c93c7491dd5308e0119c637ce9bcbe2e7d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.26.0/sentinel_0.26.0_linux_arm64.zip"
    sha256 "480397e67b70f7d3df07012d317ad85b732e4361dfbbfa565503332bbb37e2d4"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
