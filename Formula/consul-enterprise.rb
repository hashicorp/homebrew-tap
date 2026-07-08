# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.0.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.2+ent/consul_2.0.2+ent_darwin_amd64.zip"
    sha256 "ecb51b07b95f128250d2377fd64ef2d3b91429c7862ff3a5c7c4747ad32d8573"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.2+ent/consul_2.0.2+ent_darwin_arm64.zip"
    sha256 "7af0dc3b4dc8508f24ed2d34c06e7401a6262d14d7f91dc14af10f10943990d6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.2+ent/consul_2.0.2+ent_linux_amd64.zip"
    sha256 "c23d458937c5ddf276ff9185f86a6486ab52a4cb7ed8539a78af1e2517591d3d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.2+ent/consul_2.0.2+ent_linux_arm.zip"
    sha256 "5411c62fd46cb8032473c8884cdbc3281689898cf7d73889e4d3737a922ae026"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.2+ent/consul_2.0.2+ent_linux_arm64.zip"
    sha256 "1a483f87bbb62990ada991cf0dafcc49afcb1d81f3918b3fff4ca565b46db324"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
