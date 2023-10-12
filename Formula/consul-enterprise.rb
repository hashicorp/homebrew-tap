# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.16.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.2+ent/consul_1.16.2+ent_darwin_amd64.zip"
    sha256 "86b64e800f4f0e841084ac8f9e3daa7d67fa64a2a3f906f8897379cfbf8c4b96"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.2+ent/consul_1.16.2+ent_darwin_arm64.zip"
    sha256 "bb1b1abecc9cd7faa89a3ad6a91c565c43581353b71cca85dcc81b8d49fa7fd5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.2+ent/consul_1.16.2+ent_linux_amd64.zip"
    sha256 "61194a76ba9294069ce4e7ca4a7ad5e920b4aa4ba0d2d5e2378f48f63f2073ba"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.2+ent/consul_1.16.2+ent_linux_arm.zip"
    sha256 "38335a4bf77f97cb5db22bd966aaa22a023d55b5640f29a2ab360feba83ac254"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.2+ent/consul_1.16.2+ent_linux_arm64.zip"
    sha256 "705461ac4a91ff5e678160bda0aba1b33da33850f75de068ed0065d30496be03"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
