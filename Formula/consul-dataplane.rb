# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.0/consul-dataplane_1.2.0_darwin_amd64.zip"
    sha256 "2751a2cbf88a4a80d1ef645c5ec4ca6e39fdec3d78d341b40f6cc57c2d917f4d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.0/consul-dataplane_1.2.0_darwin_arm64.zip"
    sha256 "3594df11d99694a72852f343ffafbe0fdc1b8f6f4bb6fcde411fb424e3d54599"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.0/consul-dataplane_1.2.0_linux_amd64.zip"
    sha256 "f4e672c6c69278653603905a536e1a00574795bf048196999dbca3786b7bda65"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.0/consul-dataplane_1.2.0_linux_arm.zip"
    sha256 "89584b2bcc7d8080b0987e9f0c4f45ece0b0221033a0e56b612140e2c6fa3c29"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.0/consul-dataplane_1.2.0_linux_arm64.zip"
    sha256 "c0b7a034b6fddc646a0ffc50ab6eed628268eb737cb2678df887d67fc3642e5b"
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
