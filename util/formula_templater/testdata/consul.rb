# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_darwin_amd64.zip"
    sha256 "311c593dc9be13475a42bd97016f302dbf174f6232c4fcf81218c21a5cb879ea"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_darwin_arm64.zip"
    sha256 "e06fd7783008a8944a4824747f3e8c9d98864960072201cad615f26d42ce99e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip"
    sha256 "23f7eb0461dd01a95c5d56472b91c22d5dacec84f31f1846c0c9f9621f98f29f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_arm.zip"
    sha256 "09c53fc66d46b132d5f7acb7d21758056602be9495c8a1d409ec8cef45328dd8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_arm64.zip"
    sha256 "4e5e42186ff9f7a3e9736f871a81ff3732f7e150664376e1bf290661544a4654"
  end

  conflicts_with "consul"

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
