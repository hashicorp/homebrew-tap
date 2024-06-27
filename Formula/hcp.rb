# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hcp/0.4.0/hcp_0.4.0_darwin_amd64.zip"
    sha256 "8cc36144872e513ec1a564c2086307af511c55f59e6aa735ab2e3e6db4760d88"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hcp/0.4.0/hcp_0.4.0_darwin_arm64.zip"
    sha256 "256ae425f8a8efde5636725ac2a3e59082b79af955419a8fb5795ac8b66b571c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hcp/0.4.0/hcp_0.4.0_linux_amd64.zip"
    sha256 "f60ed93b57d73d3d5fa26df59b09dc3b16f9b4ee2eadfef6b5ab216b62913352"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hcp/0.4.0/hcp_0.4.0_linux_arm.zip"
    sha256 "76d1ca62821751c08e511bd8a48277cc74d0584bccf51be2fee59ac1e6fef3ec"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/hcp/0.4.0/hcp_0.4.0_linux_arm64.zip"
    sha256 "2c1c08802be382f5965a6c8cd875db2cdf0ffadd3f433cfffb45d5ee8664d801"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
