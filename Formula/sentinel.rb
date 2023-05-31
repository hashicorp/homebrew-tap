# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.22.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.22.0/sentinel_0.22.0_darwin_amd64.zip"
    sha256 "223d338b156ee794d50071690643ac79b7950578d3a70544d02ae0d312109ce2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.22.0/sentinel_0.22.0_darwin_arm64.zip"
    sha256 "8b7ced20df3437e8115aea5cf960ed8e61484d79927310d11277091d5db48155"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.22.0/sentinel_0.22.0_linux_amd64.zip"
    sha256 "8a59cf9179a7d624e3d4a74eea9902cb68ba7fec99e8aa8b97cc54aa656a617f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.22.0/sentinel_0.22.0_linux_arm.zip"
    sha256 "5e5ba11505825840aa22be573bd5f58af98dd866d62e065996f8c64509a8d0ab"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.22.0/sentinel_0.22.0_linux_arm64.zip"
    sha256 "79f4004cf06e29f287e984fea963223f2bef2b3faaf52d5db4f03c2f5b2b6ada"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
