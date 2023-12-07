# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.24.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.0/sentinel_0.24.0_darwin_amd64.zip"
    sha256 "108a9d0cb6531e8beac4a37f98c72a1248d491f0eb5ee09b9a1bf887dd9d871d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.24.0/sentinel_0.24.0_darwin_arm64.zip"
    sha256 "d79a1823c34e7867b49ccf4a224ec24dff21185466ebb3afa5636c98cc6cffc9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.0/sentinel_0.24.0_linux_amd64.zip"
    sha256 "04d4489eff0134a6632a8504b213f0a54f0dca28a7112ba224268cc6bce43986"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.0/sentinel_0.24.0_linux_arm.zip"
    sha256 "9cd2e409d99bf96a0cc872295dd3b475cce82851d3d3bc6c0f2d3276b2412df7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.0/sentinel_0.24.0_linux_arm64.zip"
    sha256 "e34bfa125f9328f98c2942769707c292b53ae9578be8b3b5caabe4626a421fb7"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
