# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.41.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.1/consul-template_0.41.1_darwin_amd64.zip"
    sha256 "5c008784c8a8324890ceba81f108196e52c046b81138685ae9869c6beb0cb8db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.41.1/consul-template_0.41.1_darwin_arm64.zip"
    sha256 "f7aa19a959c0404640a5063fc8cee9fb2dc2f0e0de8a0752f964bacf467e13f2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.1/consul-template_0.41.1_linux_amd64.zip"
    sha256 "ab68e09642437dcc5b6e9a572a1924d3969e4fe131f50a1a3a4f782d7a21f530"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.1/consul-template_0.41.1_linux_arm.zip"
    sha256 "0d5605f735a879b0219773469bae2ae45d75e5bd389f290e1af9cb550591669e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.1/consul-template_0.41.1_linux_arm64.zip"
    sha256 "b768fc22916b74b90f470e2e784d94fe967b3732bab32ac4040d5fae3f7af95e"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
