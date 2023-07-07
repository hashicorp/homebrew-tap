# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.3.1"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/consul-k8s/1.3.1/consul-k8s_1.3.1_darwin_amd64.zip"
    sha256 "d25f8ed53018ae93b8127fe7eba5b994b1a960dc65683d9b17885ae70e9c6004"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/consul-k8s/1.3.1/consul-k8s_1.3.1_darwin_arm64.zip"
    sha256 "04e078df553536b866663e5e886ba9ab89bc7bbcef9fec8d445cfd6bba16e4fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/consul-k8s/1.3.1/consul-k8s_1.3.1_linux_amd64.zip"
    sha256 "5f92e36742ef6c281a37df3cbf5db8215a6950a0c691cfd4e96a0eafcbcd6b90"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/consul-k8s/1.3.1/consul-k8s_1.3.1_linux_arm.zip"
    sha256 "12222288a377cb44653c3a391f715401b91915df8ef685b91dda9a673ca79adf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/consul-k8s/1.3.1/consul-k8s_1.3.1_linux_arm64.zip"
    sha256 "604817de5279d51c26499b6cb602a7173cc88ab18d5adc627fd13cf4e2fb1aed"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
