# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.37.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.5/consul-template_0.37.5_darwin_amd64.zip"
    sha256 "f4b3b7892b05e1cc53cebf737f491e48358ae044c753cb378564b5de44acea53"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.37.5/consul-template_0.37.5_darwin_arm64.zip"
    sha256 "e0770f78264307e0f3fa45c5e646fbc5075beb9ea1f498bf8d35534ebffd88f6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.5/consul-template_0.37.5_linux_amd64.zip"
    sha256 "1fd7b9fc8d2086bddecb619bb6c619089b38a54acc649fe8cbdbb181b960a255"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.5/consul-template_0.37.5_linux_arm.zip"
    sha256 "7a3d91b808e21b6ff2f7719740055676137da4a82a4b9d48954316917fc74fb3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.5/consul-template_0.37.5_linux_arm64.zip"
    sha256 "e08f4f6fa43ff0cf4b91db8e742de66fefc3dcf85507d4a0787f606d68569ec0"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
