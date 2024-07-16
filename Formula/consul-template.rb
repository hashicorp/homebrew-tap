# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.39.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_darwin_amd64.zip"
    sha256 "c06bfdf46a7012c6530b6e3f0382e475d61a5ddeb0d321e1f8cd6ea264b7f355"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_darwin_arm64.zip"
    sha256 "1458d3233ed7cf1d451729a468ee07e37963c462ea11518952b1ac086cd4ed01"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_linux_amd64.zip"
    sha256 "b77c7550defda78c62b036c734e7faceb7f89519dc12406db84f2c3af06bc5fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_linux_arm.zip"
    sha256 "f0802b030968b64e439e266f4bfe80a05e8b5301a6d1fd882802387e3e41febe"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_linux_arm64.zip"
    sha256 "c3f3538ec7297a5c05302c9c2958cf8384c00f164d51205db0fec735d9c6f6bf"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
