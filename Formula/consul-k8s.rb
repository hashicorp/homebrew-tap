# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.0/consul-k8s_1.3.0_darwin_amd64.zip"
    sha256 "91f0928b3007b9af133826514a0b6de89df6c033e3bc7fcb19ef24679bd519bf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.3.0/consul-k8s_1.3.0_darwin_arm64.zip"
    sha256 "e5133a8e0047f6aec38a4878a1e0355fdd7d8419604161863f39f2339c292369"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.0/consul-k8s_1.3.0_linux_amd64.zip"
    sha256 "83d879e9cac88004b0248300805e40d0b23f2ee4534034bd021b86eaa3077472"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.0/consul-k8s_1.3.0_linux_arm.zip"
    sha256 "53847b7410a03c964673f23f270dcf5e94dd173654c98ba0c52ea21e85c7963d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.0/consul-k8s_1.3.0_linux_arm64.zip"
    sha256 "2f97c566c878013368b301d13bd56d817cfb3f7e2bb45ea244784a22ea230c45"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
