# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.0/consul-dataplane_1.4.0_darwin_amd64.zip"
    sha256 "97a905141c816379e98f5381390ca844c74f4925dd9a64856de5b0a92e700e0a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.0/consul-dataplane_1.4.0_darwin_arm64.zip"
    sha256 "ba43ff2bd93eb35af07abe06101559a11c75963bbf9ce6a7a2949b6e6604a126"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.0/consul-dataplane_1.4.0_linux_amd64.zip"
    sha256 "bb01480319aab35ae81aa30856e5de59a168b85df1823584e999f33af4c31c8f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.0/consul-dataplane_1.4.0_linux_arm.zip"
    sha256 "f099b557cb3f86cee739c4f78a0c37d9599d2e0159567e84416812e4961400c3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.0/consul-dataplane_1.4.0_linux_arm64.zip"
    sha256 "c853051be763462529cfc0b2811b200b07c922e9872f7011fc3164979098b456"
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
