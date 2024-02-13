# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.17.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.3+ent/consul_1.17.3+ent_darwin_amd64.zip"
    sha256 "f87dd2e5276082997f08a82f2353fe3574dd1edfcf6b4c3b4f10a60ea75fcc10"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.3+ent/consul_1.17.3+ent_darwin_arm64.zip"
    sha256 "9da6f9c5dd90025a1bf713f4abb4fa6211276d811743b9666acbd3f64fc43c91"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.3+ent/consul_1.17.3+ent_linux_amd64.zip"
    sha256 "42fb17a9c29691c5e99d9c416afd3d031e58d628b129ee9ec9040df6ed7ac0c3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.3+ent/consul_1.17.3+ent_linux_arm.zip"
    sha256 "5d5318ce47b90981a59cd71e57a112ffa7cc1c9f435ad4e513f2d690405564c5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.3+ent/consul_1.17.3+ent_linux_arm64.zip"
    sha256 "2dbb331bef3073fc079660d1e9a47565c3451bdc8074ad38bd3b151184875020"
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
