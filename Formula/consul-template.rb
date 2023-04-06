# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.31.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.31.0/consul-template_0.31.0_darwin_amd64.zip"
    sha256 "13b18a5138b13e72182d18f0fbffa809431523ca7f982a70c106c86f1c69aa58"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.31.0/consul-template_0.31.0_darwin_arm64.zip"
    sha256 "99a773bdea43f6d3eaee43cdc111d3649ab7489526721fdb74e8f9c31abd1945"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.31.0/consul-template_0.31.0_linux_amd64.zip"
    sha256 "e622fd89e731882264f170ede87023546a306f07bad42e816468223d5a6d57f4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.31.0/consul-template_0.31.0_linux_arm.zip"
    sha256 "aa34f11d4730bd827d09eaa786f5dd7d2ac360f0e3700cdf092a4654623b564f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.31.0/consul-template_0.31.0_linux_arm64.zip"
    sha256 "e18cf2423c585ea68fc2759e36be67c55d4136f46d81e688927a419bc6f12824"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
