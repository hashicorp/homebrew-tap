# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.7+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.7+ent/consul_1.21.7+ent_darwin_amd64.zip"
    sha256 "4c1ccd06402015c8cd1ee97c38fd281b1a448216216bda519bba59cf20aa2c8a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.7+ent/consul_1.21.7+ent_darwin_arm64.zip"
    sha256 "3260c9f6a8ef3880e0f6bed53b09827ca8e301af056849716c9adf6e6408e71a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.7+ent/consul_1.21.7+ent_linux_amd64.zip"
    sha256 "bc6dfe49bf8ba6c86d20483609d8fda438106a23b1d437dc682f469020013db3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.7+ent/consul_1.21.7+ent_linux_arm.zip"
    sha256 "e874c38b7809bf00c3b0b74b767945370649d0762590fe20eee9b61c53fb55f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.7+ent/consul_1.21.7+ent_linux_arm64.zip"
    sha256 "73f144e612edac70c922ddc360f60774b2a78f3600d7bbdba0aa7040ae9fbc9f"
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
