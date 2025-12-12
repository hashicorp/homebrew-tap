# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.1/consul-dataplane_1.9.1_darwin_amd64.zip"
    sha256 "620dcfd0bb8cc9a6e19aab502777f619e2aca4b4cdc0ad5c4a4cc496b392f833"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.1/consul-dataplane_1.9.1_darwin_arm64.zip"
    sha256 "1ff1c05fe8b39efcb355886bd96c588cfd11ce09f536b1cc725a2d98e2afe7c5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.1/consul-dataplane_1.9.1_linux_amd64.zip"
    sha256 "89b31970bb814f6d59fed7a1749ab85997a38ac0963bdde1525630f729e5981a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.1/consul-dataplane_1.9.1_linux_arm.zip"
    sha256 "d767b296968b5f66945b24efb0b548a4431eef78d1ba2eb8a919c918789b516e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.1/consul-dataplane_1.9.1_linux_arm64.zip"
    sha256 "c6e2d3dbcb4a3e79c830b92f9d85346f1a0391d4f8e375dbe009e1600164ce4f"
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
