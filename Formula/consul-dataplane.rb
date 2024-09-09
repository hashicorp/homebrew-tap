# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.3/consul-dataplane_1.5.3_darwin_amd64.zip"
    sha256 "ea8a5537f2db772dcec5099f83178b69e79fd2b87476aa29fe24516b3691eef9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.3/consul-dataplane_1.5.3_darwin_arm64.zip"
    sha256 "9e06413ab25c02566fb1377c42f145c4f530d322b692892995d9fa76b51f0759"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.3/consul-dataplane_1.5.3_linux_amd64.zip"
    sha256 "4e5ca1a86bbf521ae34c2ce6d61debba62d07941d0b0ff773d8be55b460859cb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.3/consul-dataplane_1.5.3_linux_arm.zip"
    sha256 "9a433e7188954d92840e04082209365dace3711ce0963316d63d672828fe4a2a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.3/consul-dataplane_1.5.3_linux_arm64.zip"
    sha256 "6f8f832ee5b27750857da029aef752dbc787baeabaf7838643621d35f6687481"
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
