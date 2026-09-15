# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.11.0/consul-esm_0.11.0_darwin_amd64.zip"
    sha256 "bb9783119c7eb2fbd0040354c1aa382f34eeb70cbf2aa5925f1a0cc55646201b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.11.0/consul-esm_0.11.0_darwin_arm64.zip"
    sha256 "7481e79f756c544b283c2162f05c812ff841b83804f09ac18f5caea3220be810"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.11.0/consul-esm_0.11.0_linux_amd64.zip"
    sha256 "75a3b92f8cd5dd9d3264a5ccc9b3e09a2b36f8d73e7853450dc0b42637b94ed2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.11.0/consul-esm_0.11.0_linux_arm.zip"
    sha256 "f380c4eeb03b21aabd0b4d67b2a3ff348261b72481b4a1232b566f859f434089"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.11.0/consul-esm_0.11.0_linux_arm64.zip"
    sha256 "7b3fd13223f3c884a0d7e539101e01d29a1e2740417971f074f81357c88451ba"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
