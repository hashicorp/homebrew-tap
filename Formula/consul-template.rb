# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.36.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.36.0/consul-template_0.36.0_darwin_amd64.zip"
    sha256 "783df340c5d1727e501b4fd1f3025674de76dc9eec8a6018fd25cc37cf67dbc4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.36.0/consul-template_0.36.0_darwin_arm64.zip"
    sha256 "7b9bfb5aeb4b3607ae2d3491d6f5a19b457e6ed44e7401c712ad6a3a7e190bac"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.36.0/consul-template_0.36.0_linux_amd64.zip"
    sha256 "9844aebb997b81dd5b58a6ddadbf650eca4b200ccbc2ad680d817528a73c0d3a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.36.0/consul-template_0.36.0_linux_arm.zip"
    sha256 "b2ca66eb026c58e7783dbcb8985ad728de308749f017e6fb99749413dd8ed083"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.36.0/consul-template_0.36.0_linux_arm64.zip"
    sha256 "261a599f411042808b430e44c6f9b6be4c19ed36a5b56dcc9e5d1f0a64576c6c"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
