# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.17.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_darwin_amd64.zip"
    sha256 "13da33379b3055918bb3f5649affdf2cb3ea8f3cb31a95d7affdfd9013482eb6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_darwin_arm64.zip"
    sha256 "e44b56094e600f044766e70b18798ad952605f94588747f7fb3d9698d6e6b2a2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_linux_amd64.zip"
    sha256 "e16489849b3b203251d93fef94d60600b59cb776c11b66959786e3484d336381"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_linux_arm.zip"
    sha256 "f026874a0d1efd23c89965026be943b731853d24d46ef5641187bede4705706c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_linux_arm64.zip"
    sha256 "e4ee4f0edadeda9436331853e5c519c9eed2f587f43ae12ba7cc5e5cdf2b89d4"
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
