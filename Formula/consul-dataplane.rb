# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.6/consul-dataplane_1.7.6_darwin_amd64.zip"
    sha256 "24c234301303ca34605622de97a732afdf23b54961ccad431ec84b100750e139"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.6/consul-dataplane_1.7.6_darwin_arm64.zip"
    sha256 "1823a5f60bfa95f7cc017b3dfb3599cdd6e388ae92cb3e487d3d7df923f7fe48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.6/consul-dataplane_1.7.6_linux_amd64.zip"
    sha256 "d1776b612104a8a65015276c9b5da3f906f65b10da73a9ba1aa3e7bf297a780e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.6/consul-dataplane_1.7.6_linux_arm.zip"
    sha256 "e9a61720ccc2cf2478451cd94fc42a0ce3ed3dda77ccfe602b852a153b9eac39"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.6/consul-dataplane_1.7.6_linux_arm64.zip"
    sha256 "59bfd35ba72b078b6a9ac0ec81c41332df0f880ce64e52fefc1e708b04b8edec"
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
