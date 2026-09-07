# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_darwin_amd64.zip"
    sha256 "281f6b4b73bcc05240a645b6e11bf579954fbfe58571b7daebfe241e8a4dbef2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_darwin_arm64.zip"
    sha256 "86e54668db0cf8204415e1314d487f6f45259b43b6d938e70450166a0f8628b5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_amd64.zip"
    sha256 "60eeeb99b4337623a82c5197a86e31362b50a885496d8c55fd246e6dbe6994f0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_arm.zip"
    sha256 "93f0a7dace3f219f5229bddbf0342ce51d30d9d51968bcd6fd30cf0238dd0c86"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_arm64.zip"
    sha256 "3f7c13796db4b168aaa3f2a791d4cfd1720868b52727fe626b74ebfbe7eaaddf"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
