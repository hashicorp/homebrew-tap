# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.2/consul-dataplane_1.9.2_darwin_amd64.zip"
    sha256 "ac38f98ce1b023c76e4e3024999426e7486eb363a96fc168c0246f6470e75736"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.2/consul-dataplane_1.9.2_darwin_arm64.zip"
    sha256 "231708b5a0c222739482889756dc9c83c3cb55f7111d819fe4e84070f8b4b0b5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.2/consul-dataplane_1.9.2_linux_amd64.zip"
    sha256 "4cc8c7df29a750f674eca80e447b6f0671a68c7daad110e0cc3056f827904cd8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.2/consul-dataplane_1.9.2_linux_arm.zip"
    sha256 "c221f946c19c0a862999846f603182ac7489667f3476759c2d726c031b0bb764"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.2/consul-dataplane_1.9.2_linux_arm64.zip"
    sha256 "4ba5eae58e554662fcca91406f412f61409b327ed40a644fc0ca6cbc5547af60"
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
