# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.2/consul-dataplane_1.5.2_darwin_amd64.zip"
    sha256 "f511f9577dca3f74051d663a9ccbb1949761805c340782e1b1226e1b916bc5c6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.2/consul-dataplane_1.5.2_darwin_arm64.zip"
    sha256 "222a8b92adfc5d32a04b8c7a458010e20b3a04c348d578c1f3fc16aae5865a83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.2/consul-dataplane_1.5.2_linux_amd64.zip"
    sha256 "53c5efa85e2626fee0fe4987e2a332606d143f76c726e9a4c4bd566e35b8a320"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.2/consul-dataplane_1.5.2_linux_arm.zip"
    sha256 "72979e7608f2dd1a5c1451df787e2ee81706ac06bf0c827503a7dcabac0830fb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.2/consul-dataplane_1.5.2_linux_arm64.zip"
    sha256 "bac577fe2ce975764cba111f8a53cefcb7e969266304f6a8c81b726de0ca4076"
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
