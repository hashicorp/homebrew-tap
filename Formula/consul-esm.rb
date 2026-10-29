# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.11.2/consul-esm_0.11.2_darwin_amd64.zip"
    sha256 "f659f404c678339da3edeba70dc68cc96f4e92ecffe6bd8302eb88cbb1f739f3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.11.2/consul-esm_0.11.2_darwin_arm64.zip"
    sha256 "6aa0e23dda3c30399cf35681cad16f2c46aa65e93d798ccf3f5b179a4fd7dcc9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.11.2/consul-esm_0.11.2_linux_amd64.zip"
    sha256 "215a9839fae0b09c62beee4d302e1fad5448970e3422100bca05b4bf8021a2c3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.11.2/consul-esm_0.11.2_linux_arm.zip"
    sha256 "a9f016ba546d51cc419399f34fedd60cd6f406c6ba82c2e822106009328200d7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.11.2/consul-esm_0.11.2_linux_arm64.zip"
    sha256 "93d86852c5251b7c4c3d46ce60b55e13fd2772a5f04e9a5873489bc58e7abee3"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
