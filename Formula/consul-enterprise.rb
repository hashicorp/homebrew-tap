# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.3+ent/consul_1.22.3+ent_darwin_amd64.zip"
    sha256 "1e87a9f8a0ffcca381c8ee2b3b54089e980dc9f0842af7fada8e064b9057e83d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.3+ent/consul_1.22.3+ent_darwin_arm64.zip"
    sha256 "0a939c94dfe3755f60e90868b62c3484164d251e361ca52182a2acdcf105114e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.3+ent/consul_1.22.3+ent_linux_amd64.zip"
    sha256 "f71d91dbbcae118fe9e6019399dfa5874ab7b36f8bdeef323fc73e30ec580e0d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.3+ent/consul_1.22.3+ent_linux_arm.zip"
    sha256 "e5a95bc26c302448c2adbcd397199a97c71b7b5a6b86d3af687611529503002e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.3+ent/consul_1.22.3+ent_linux_arm64.zip"
    sha256 "9d6463069324768599fe4e90486632044b762a4b7cbce1a981a57b4c22fdac42"
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
