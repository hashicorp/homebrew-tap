# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.0.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.1+ent/consul_2.0.1+ent_darwin_amd64.zip"
    sha256 "0027494f969b1ae5f6627050b0d4f8be67483914779bb2e15929a1a6d268af7a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.1+ent/consul_2.0.1+ent_darwin_arm64.zip"
    sha256 "2d9f5a53865d197b12fc70ded6f6c06680466df484fc33c74c1d83a2a711a9d2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.1+ent/consul_2.0.1+ent_linux_amd64.zip"
    sha256 "936a904290c5442241acfbd054d03699ed743029a82f65e528e6c88eda894d8d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.1+ent/consul_2.0.1+ent_linux_arm.zip"
    sha256 "f5b4b79ada9e67e235a15f3a063d31a98fd19066bf9ac3aca1f8deadd564a28e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.1+ent/consul_2.0.1+ent_linux_arm64.zip"
    sha256 "81ca34c975965259b953fc6ff08890118777254871ecffbd6c408e68be4a86c5"
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
