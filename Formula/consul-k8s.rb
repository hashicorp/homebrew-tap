# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.3/consul-k8s_1.9.3_darwin_amd64.zip"
    sha256 "f4134e87a5d7ee465cf67695ec8946a5d9b4fa7f52ac135c40f96f7db326f242"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.3/consul-k8s_1.9.3_darwin_arm64.zip"
    sha256 "fdb2371ef617daa278b16383963c637e88345b170926b749b12d7174531625f8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.3/consul-k8s_1.9.3_linux_amd64.zip"
    sha256 "bc1de3c679113d4ddb8acd655d07cc5ba6e000b6a5b9833fcb21083a75e9432d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.3/consul-k8s_1.9.3_linux_arm.zip"
    sha256 "0bb21f513536b4547133c3b2689ae9976f72bb527376b2691cc79b953794b5ea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.3/consul-k8s_1.9.3_linux_arm64.zip"
    sha256 "7aa7b3c736c566cc36ce55ab28be5051884500babf0aa32bee74b7a96b77910c"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
