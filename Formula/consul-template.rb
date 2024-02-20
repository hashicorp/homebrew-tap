# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.37.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.0/consul-template_0.37.0_darwin_amd64.zip"
    sha256 "8d1efad4661c7509fa5ba1ca358ba0be19f9ae509938be7ccc5adcccff071a45"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.37.0/consul-template_0.37.0_darwin_arm64.zip"
    sha256 "2cd1c37ba1b16ed78cc75660dd4df98761d5ab29d2103bd62f3f151029903360"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.0/consul-template_0.37.0_linux_amd64.zip"
    sha256 "4695bf2c316d771f4574a1347bcdbe230f3c30f3b0c16faad2eaaa7797b73ae9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.0/consul-template_0.37.0_linux_arm.zip"
    sha256 "d47b0facacf668eeff4bb7847cce0b267e76e8bf7e4f0cb8686bc1310af7e9de"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.0/consul-template_0.37.0_linux_arm64.zip"
    sha256 "a0dd59b4f42b63c3039a89d2430adc2d1a135d3fc680a8a2bdd50ab9e49efc59"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
