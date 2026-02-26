# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.4+ent/consul_1.22.4+ent_darwin_amd64.zip"
    sha256 "3a2c5b331cebc41fa350824c876ce39e403fab950259f1ed855e31e95d276f86"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.4+ent/consul_1.22.4+ent_darwin_arm64.zip"
    sha256 "4720f7ec6277e9166d741bf521d5cf8f9e2734be6ba30b9e81a16dcb41935b12"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.4+ent/consul_1.22.4+ent_linux_amd64.zip"
    sha256 "85cc306f81c09149452ef4b1873bc98ef5cc32541953cbcca2edb78b6677c85b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.4+ent/consul_1.22.4+ent_linux_arm.zip"
    sha256 "58a1810f4bbdc8dc1655d38e677759431d16bc16ff868b7cb38d7e7909d3a089"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.4+ent/consul_1.22.4+ent_linux_arm64.zip"
    sha256 "bf083d6838ed54a823217dc94eaea0ae41c74d67e9ee5324881069d6cfb17fec"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
