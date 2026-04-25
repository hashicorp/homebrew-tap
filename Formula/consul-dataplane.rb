# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.7/consul-dataplane_1.9.7_darwin_amd64.zip"
    sha256 "88d26868ec3d6ca20ddd70590f5255e33ef3f3f40ea8f282f8fe20c7e3369a60"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.7/consul-dataplane_1.9.7_darwin_arm64.zip"
    sha256 "cf546944298d4b937018d7c42960928e649872c0f5d09be7faccb9ae4e83152a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.7/consul-dataplane_1.9.7_linux_amd64.zip"
    sha256 "a0efb1342460d9992190fc92589ed2889780e8a11e58c4ccc1e5cb5b73f0c9be"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.7/consul-dataplane_1.9.7_linux_arm.zip"
    sha256 "ed38a31958d96f431ba3fce4d6d6c9db56480e7d97ba00cd946398cdd697d119"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.7/consul-dataplane_1.9.7_linux_arm64.zip"
    sha256 "0b01426c89ada4ab11f30f79e2e08bc60bdc3fb6b8314214e05fe623749e1ef0"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
