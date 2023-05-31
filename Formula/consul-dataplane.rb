# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.1/consul-dataplane_1.1.1_darwin_amd64.zip"
    sha256 "c180eff8318b7873b308831332292bec3b904fc55c9138e8c0ccd7f567aa37a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.1/consul-dataplane_1.1.1_darwin_arm64.zip"
    sha256 "ac269d2da99d1363a1754f2a12d533543bbbd4591854856e3c42010947a35196"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.1/consul-dataplane_1.1.1_linux_amd64.zip"
    sha256 "c4d7f2dc330fead4bfc611e880b4f9070e3623f6f221487e99e89dd54ad97ff6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.1/consul-dataplane_1.1.1_linux_arm.zip"
    sha256 "520760b812690d36b549e0604594eab819c260c0af77f58925c92fda1932ddf1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.1/consul-dataplane_1.1.1_linux_arm64.zip"
    sha256 "0ae8bb84eb1943158a81dd7edf72fdb7b08af290e285a543c289e193381570b9"
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
