# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.5.1/consul-k8s_1.5.1_darwin_amd64.zip"
    sha256 "a9bfca6b0975a3d51e488abb179b562853db164e3759f38b25f2c3f7d2a1a354"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.5.1/consul-k8s_1.5.1_darwin_arm64.zip"
    sha256 "d8f11ae409675483be4e8231f85b9795f633d57ae9f3b782aa296e31b1b16282"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.5.1/consul-k8s_1.5.1_linux_amd64.zip"
    sha256 "fbe90c7d0a73a2ab2ef0544005607498b6448b77b45837c14fbf22b3a46d5976"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.5.1/consul-k8s_1.5.1_linux_arm.zip"
    sha256 "3437d0ac9ab363dfc92fa8b0eda2be16aac6d32d03867888a58e185411e66511"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.5.1/consul-k8s_1.5.1_linux_arm64.zip"
    sha256 "738df5857ffd4bc58a3c5eea709b93ba0c37405c2388fe47958555379cd80f9a"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
