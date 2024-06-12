# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.3.0/hcp_0.3.0_darwin_amd64.zip"
    sha256 "d408f4bbd15c461efbdd422dc90fc5a5af775e4d15f53b47d9fa1eb3b642c219"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.3.0/hcp_0.3.0_darwin_arm64.zip"
    sha256 "73033275d5b8f83305c0951fd870297d109d0b683f237f46e943136fb98a25a8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.3.0/hcp_0.3.0_linux_amd64.zip"
    sha256 "7491ec2d4860b2b14b28464d7e89a4f3687b345154c393344114f7a0df2b8fa3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.3.0/hcp_0.3.0_linux_arm.zip"
    sha256 "d8135c451a478285d8a2eafca224a342056357266baab8a8cbe11a76702a0d55"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.3.0/hcp_0.3.0_linux_arm64.zip"
    sha256 "491e34db09e544218d32c99cbf27231f5cae0d33065b31298bd8605afda1a91e"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
