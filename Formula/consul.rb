# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.18.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_darwin_amd64.zip"
    sha256 "0f37f16acaa5ed14a20720f1afaf60228d6f574d5dbfa39694f32ff0e182e52b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_darwin_arm64.zip"
    sha256 "2f05ff672ec492bf6e40b16c275ea32b46de73f1cbe486eeb12f9a170b7084fb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_linux_amd64.zip"
    sha256 "522045180a4e644af6e2d97824850b470545f176aabdb4898635afda512a6a3f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_linux_arm.zip"
    sha256 "e77b29ed91a551405df4e2b16ac36682ac2495dd660335154a602cab4342a734"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.2/consul_1.18.2_linux_arm64.zip"
    sha256 "7eec1c8d50f99284abc28a2e4678ff1bd1265811a5e2a2a037ab7f5c043ac518"
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
