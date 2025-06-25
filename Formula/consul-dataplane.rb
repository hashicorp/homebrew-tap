# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.2/consul-dataplane_1.7.2_darwin_amd64.zip"
    sha256 "e963116896ba86f81ff83dda741146bdfd7716504b6565fa64f57b4a5fa5f7c5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.2/consul-dataplane_1.7.2_darwin_arm64.zip"
    sha256 "fb6d362e76ce6040515d8b71a5e41ea451f434cf354e8c147c1486cb1aff548d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.2/consul-dataplane_1.7.2_linux_amd64.zip"
    sha256 "d8d139cc10daeb6cca2939d32ea02a8d47bfb33dcb2bb25dc30573507da6e599"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.2/consul-dataplane_1.7.2_linux_arm.zip"
    sha256 "fdc2f83f64f39769b9143b835c7aa5dd822922eeb4895f4cd4698647b53682c2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.2/consul-dataplane_1.7.2_linux_arm64.zip"
    sha256 "2a949b61407805b9c8a802aabcbcd03cfa6a7ec81d2c1f756a2949fc1db8d038"
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
