# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.3+ent/consul_1.15.3+ent_darwin_amd64.zip"
    sha256 "fe1e0f025ddbed16adff2cc55e2ab783a9fb163e74adb238a306a2e14321acae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.3+ent/consul_1.15.3+ent_darwin_arm64.zip"
    sha256 "571f7b1050813e764ac9deea8a7f0ace385a4da5b9e915b3476d94939d605ce7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.3+ent/consul_1.15.3+ent_linux_amd64.zip"
    sha256 "802d33211d968bb7ed4be10048d6a4bdae86349472560ed00a9ee92030bb3ded"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.3+ent/consul_1.15.3+ent_linux_arm.zip"
    sha256 "19136346e86fbbc1a64ad16ab2a65977c31edfce8197a381fdb88c97f553cee5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.3+ent/consul_1.15.3+ent_linux_arm64.zip"
    sha256 "8734daf41c24371caf27455121fad05209edc4b2f88b2ed82b084c787ef4e59b"
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
