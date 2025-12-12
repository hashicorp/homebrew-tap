# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.1+ent/consul_1.22.1+ent_darwin_amd64.zip"
    sha256 "8521b0b2127bf76b8886819454ae9a1a5c78ac4b8cc499b0f4e87f1dc637f49d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.1+ent/consul_1.22.1+ent_darwin_arm64.zip"
    sha256 "722a07af7674260804f2bc798aa65b9662db9490536a014d47066df7d8c2945f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.1+ent/consul_1.22.1+ent_linux_amd64.zip"
    sha256 "0b911088d92289e7add6d418f47f1cdf65fb20f15ebfc516bcc54c7779e5e7f5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.1+ent/consul_1.22.1+ent_linux_arm.zip"
    sha256 "662e87f1e3feb89229dcb411f654d503cb3ca744a1b3a90c0c3303145ff12d0d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.1+ent/consul_1.22.1+ent_linux_arm64.zip"
    sha256 "a9b59b01ab7a1f54ef92f999f4d71456fa2978805f3e87dade90a8e5cf9606de"
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
