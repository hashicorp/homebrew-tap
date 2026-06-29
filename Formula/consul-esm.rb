# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.10.0/consul-esm_0.10.0_darwin_amd64.zip"
    sha256 "2c28f2ac19dc5faf642166a2b58b27a6d4759f4d1711828d467817a104bb5a2c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.10.0/consul-esm_0.10.0_darwin_arm64.zip"
    sha256 "39319ad32974113755c04195f957589420fcc9caa88399b5b0f687484bd28fbe"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.10.0/consul-esm_0.10.0_linux_amd64.zip"
    sha256 "39f8156634905241ff454c434b961107c67a8768cf89e128608222e60e2d0821"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.10.0/consul-esm_0.10.0_linux_arm.zip"
    sha256 "0be64b733fe6eab7defd3383d820e18b97a21f633c684eb2cf9c1ec95c8016fb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.10.0/consul-esm_0.10.0_linux_arm64.zip"
    sha256 "a35d4c0d35a6edaae2e437e67296e01d4119d72adee1bf21922f9a1fbdf7ea36"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
