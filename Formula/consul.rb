# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.19.0"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul/1.19.0/consul_1.19.0_darwin_amd64.zip"
    sha256 "1a1152eb5739d2bc2cdb0bf85d7fa67457ce5af550897d3b7d9183ad79a0e142"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul/1.19.0/consul_1.19.0_darwin_arm64.zip"
    sha256 "02b6bbc76dae9b49a610af7f0f1caea65965e8fa9b126a75c7085cc3474da20b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul/1.19.0/consul_1.19.0_linux_amd64.zip"
    sha256 "e337fba12295fc7bab177a84a7616eb8bcc827f032a2982c8c0e417fbe86541f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul/1.19.0/consul_1.19.0_linux_arm.zip"
    sha256 "5d8d9a024ce54d74f3867b5bd09e93522728f5bfbe4bb6bb5e90ab630684eb92"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul/1.19.0/consul_1.19.0_linux_arm64.zip"
    sha256 "6956d1bf8070a37fdbdbdfc018fb7aad7ab24ea9867d0f05dad35c7e26a43f33"
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
