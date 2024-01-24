# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.3.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.2/consul-dataplane_1.3.2_darwin_amd64.zip"
    sha256 "f00012b5e25d538a78c7f8ee474615c6db44d150e0593ce435c0108fb28e7c0a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.2/consul-dataplane_1.3.2_darwin_arm64.zip"
    sha256 "b8cbf504e974255f8b4e007a783ae1008c59295996f2da9b4ef1fbb9445954fd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.2/consul-dataplane_1.3.2_linux_amd64.zip"
    sha256 "71d23f53159e74aca9d7957376bb09110801ab61bad1275ef70be6b3c950a0e3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.2/consul-dataplane_1.3.2_linux_arm.zip"
    sha256 "2aa16e02b1cbc117ab32891cae283478cadbabb1ea22ca1c9e2faf8fa2f76493"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.2/consul-dataplane_1.3.2_linux_arm64.zip"
    sha256 "837989bd4f65957a0741c4a3be68f18d4711d03fcd5bd803db9ae2b1bd8ba46e"
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
