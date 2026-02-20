# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.4/consul-dataplane_1.9.4_darwin_amd64.zip"
    sha256 "9eb6f34d4761c87b63e962e78f2bf35cd7e8590d075e3ff8f3dcab447c1bd990"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.4/consul-dataplane_1.9.4_darwin_arm64.zip"
    sha256 "2d9236d85e6e0f5a9451f2899a071e601246deef3a8c8baf0ff8c2d498378d21"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.4/consul-dataplane_1.9.4_linux_amd64.zip"
    sha256 "6e573bdda9972b9ba3f0560e670394718c29557adfdea2e11680b78d621b276b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.4/consul-dataplane_1.9.4_linux_arm.zip"
    sha256 "3f2b4dc5da1ec264b1301220e59266033a106e2bca3f0c2859a21466ffcb5df5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.4/consul-dataplane_1.9.4_linux_arm64.zip"
    sha256 "d2f70548c82fb1410650f74b9acba35632f017e13f69e0975871dc34f05ac99a"
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
