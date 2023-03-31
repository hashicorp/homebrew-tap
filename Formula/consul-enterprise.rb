# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.2+ent/consul_1.15.2+ent_darwin_amd64.zip"
    sha256 "6b11ed7697d557a08953f8e08c6a60f1d42d44c227adbfff689b9d9057ac1480"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.2+ent/consul_1.15.2+ent_darwin_arm64.zip"
    sha256 "31af240f15ae50c8a8722a3ff5fa3ca7e728be32fc4f07ff3571e42093b0fcf4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.2+ent/consul_1.15.2+ent_linux_amd64.zip"
    sha256 "95f574636e1742d2803ae2b7052716216695fa188bad58e14c0d78431293ee9e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.2+ent/consul_1.15.2+ent_linux_arm.zip"
    sha256 "217d04653c966ac606093620e3181fdfcd82ca501d72f09677f29906f8dc4209"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.2+ent/consul_1.15.2+ent_linux_arm64.zip"
    sha256 "07addbdb0e9aca4330b516bfba408c8b4e17b23036a7c0e93b7c91f157a74a43"
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
