# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_amd64.zip"
    sha256 "017d94d565dc3c4769472978b033be354ded1a1b8baf1230225587e9453ce5bf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_arm64.zip"
    sha256 "746e127366c94b8fc6838c877c41d26df65a1ca4936dbbddd596b4ef3d5622e9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_amd64.zip"
    sha256 "bc1d8c351d277bb1e93d3d2a209b9282ee5d84e3a82ce3c38281f40318b5268f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_arm.zip"
    sha256 "01acf7c989820f399effedd75a3bfa189de5e3853b58bb670b070fd9445f8594"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_arm64.zip"
    sha256 "47e607ef585fb0f4fdffa9de9364e28ecba7a1c9dc80734d4a20f5744d5a37d8"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
