# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.30.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_darwin_amd64.zip"
    sha256 "2d571d433063f71ad67f2acac7b4c246493d470851760b51157171546d8cd01a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_darwin_arm64.zip"
    sha256 "22f5de7ca704fe76915b284159ddc54ae5b591688a1188fa9d15fe2223adb5f8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip"
    sha256 "c78db0f0eecc4d314a5130e3b4c8bd17086c6cd9080c4caf69c606de67cbe212"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_arm.zip"
    sha256 "ad705caf53828ff6a3a23cff42ae7f49b6bc656a9b794d3742676c150d16725b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_arm64.zip"
    sha256 "2bffd21b77d65704b467f212df0553e73dd5158ca2a0aaa29d7ca39c76f43fc3"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
