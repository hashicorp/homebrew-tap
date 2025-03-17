# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.4+ent/consul_1.20.4+ent_darwin_amd64.zip"
    sha256 "61202637cd9644f1a8060b43da100dd32e34097716f88426a8929c92ff8cd33b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.4+ent/consul_1.20.4+ent_darwin_arm64.zip"
    sha256 "c0437fbdf6c87e2f19e4b47546318488f4807b615d63e173d57650405dd1674c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.4+ent/consul_1.20.4+ent_linux_amd64.zip"
    sha256 "44f8fc9cd2f3d2cb6fd171fb6535af0063cc19b204d314d1d110a9a6cb8731eb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.4+ent/consul_1.20.4+ent_linux_arm.zip"
    sha256 "399cb1ea159ed805a3e93cbc41c75b579fce9e10a2bd148fca27e3556d2b931e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.4+ent/consul_1.20.4+ent_linux_arm64.zip"
    sha256 "555cf3725eba0bbb49e94ca0ca11880d01d6e9452ea6c7aa26c4efe6c461da55"
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
