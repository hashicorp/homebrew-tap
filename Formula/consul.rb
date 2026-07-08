# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "2.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.2/consul_2.0.2_darwin_amd64.zip"
    sha256 "4e76391b19d2e2db08cd2a910acadc6e67b9e1e9333a7434a7ea3c6c977a8889"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.2/consul_2.0.2_darwin_arm64.zip"
    sha256 "5954509aec5ed54dabc88fc8e357756c7b0dc56437bd296c1399e525e3657417"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.2/consul_2.0.2_linux_amd64.zip"
    sha256 "96e56c9d06b4a15bfa316afa39af926c1b67d189f66388dc1eecbb7c26faeed4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.2/consul_2.0.2_linux_arm.zip"
    sha256 "0f64f052ff5be035692e5f9043bf60fdb36e023b6ef1b586c687b9449912796c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.2/consul_2.0.2_linux_arm64.zip"
    sha256 "70c13b33f47da13c7c797b57d6ccc8a738ecf33c8e3aec4c268640dc17ba660c"
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
