# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.5+ent/consul_1.22.5+ent_darwin_amd64.zip"
    sha256 "d2b17dae9e81a9bc336af43519249bc4227b34a37b70b37462db401b12091210"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.5+ent/consul_1.22.5+ent_darwin_arm64.zip"
    sha256 "796b11ab0634ee2bf0b92ddd5c72a930b46751afe223b2f21358cf8f75ec66d4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.5+ent/consul_1.22.5+ent_linux_amd64.zip"
    sha256 "f11c0c305d591d8ade9b4535666e67c502e92d1515aad3944e4e6819f769ff2b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.5+ent/consul_1.22.5+ent_linux_arm.zip"
    sha256 "ea9cd5025c9f1af3d0c4d1f661269e76198efb57ecac34729a29a1561a4a441d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.5+ent/consul_1.22.5+ent_linux_arm64.zip"
    sha256 "d04f6b203a53a9a02e2243c398b3da5e10990f8bd3e02b70b3b37ecd7c24407d"
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
