# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.41.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.2/consul-template_0.41.2_darwin_amd64.zip"
    sha256 "4202c7a90981df96bada82a6bceb94d3133da0fb888afcec80b55c48f6841500"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.41.2/consul-template_0.41.2_darwin_arm64.zip"
    sha256 "fdf25182a8e0c1be84cdda508e28f70b0b8e8addaa91c31580b30415e0c4c7cb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.2/consul-template_0.41.2_linux_amd64.zip"
    sha256 "03a8ad4c3daf718dd0bbc14f45e5fcd05eba1d5d04e545849f1cb929a7ee5e54"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.2/consul-template_0.41.2_linux_arm.zip"
    sha256 "e309efb8cfab32a5de4a0c3afc02c7fc84f42c0e02a177512be766631b92ccaa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.2/consul-template_0.41.2_linux_arm64.zip"
    sha256 "2967cc8d19875d9ae7a44771072465034b148cbd328e06dedb029b3fb75f354c"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
