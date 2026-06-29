# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.1/consul-k8s_2.0.1_darwin_amd64.zip"
    sha256 "c0a5e9a8a37598289512cf57a8cd4d4fad976cb373acfbcc2c0268c95d1c2e30"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.1/consul-k8s_2.0.1_darwin_arm64.zip"
    sha256 "02dcf84c48823e70fc0a55e048456b22fcfa3ddb860647b40d24836ae8e7a5db"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.1/consul-k8s_2.0.1_linux_amd64.zip"
    sha256 "e988e4d3e24387df35ae10f50948faab32434a5cce80fa233ae8512e806271c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.1/consul-k8s_2.0.1_linux_arm.zip"
    sha256 "c0cedbce1584dd6a82f8bb66372bae8aacd9fdd6ec1becf9b260f3050511e34c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.1/consul-k8s_2.0.1_linux_arm64.zip"
    sha256 "53f6b1fc34a8818a68f0f17061aca80bdb703beaf39cb6c6f7375e4b0845beb0"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
