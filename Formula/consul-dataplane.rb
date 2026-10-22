# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.1.0/consul-dataplane_2.1.0_darwin_amd64.zip"
    sha256 "5a0219ca775248fdb796171c3fd781f419094620537305c5e1c055bfa9b48b70"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/2.1.0/consul-dataplane_2.1.0_darwin_arm64.zip"
    sha256 "df539457fbd2a6cc89749ae5eeb8991190b2dc3baafe1d47993c0bd8465e7ad5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.1.0/consul-dataplane_2.1.0_linux_amd64.zip"
    sha256 "e73861104867b9dc3f21b97d9aeaa40a9b51f1d32dacb134e21b7fe173724de2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.1.0/consul-dataplane_2.1.0_linux_arm.zip"
    sha256 "aa1a5248cd39fc84ab3f0e14d85f8f526a863c1b452a51d25be07170a8f057e3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.1.0/consul-dataplane_2.1.0_linux_arm64.zip"
    sha256 "01d36cd1c635ee48d0340f926f57a06aca3dfc1cddf0aed5ed99a82fb09cca37"
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
