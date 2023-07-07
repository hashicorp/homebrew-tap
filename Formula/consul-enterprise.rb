# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.17.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/consul/1.17.1+ent/consul_1.17.1+ent_darwin_amd64.zip"
    sha256 "3034dc18ae3bc9e7822e26edec93f6d7b0e8e86b6b6afb94f3adb16413e300da"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/consul/1.17.1+ent/consul_1.17.1+ent_darwin_arm64.zip"
    sha256 "7f8c35b9964d596f955ebc10485ab10cd978cb4f0187e337fdf3cc3660da2a81"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/consul/1.17.1+ent/consul_1.17.1+ent_linux_amd64.zip"
    sha256 "0233d76e2352e7bd3529dce90de0e2b9e468f40a4f8e963b7fda2d3a119721ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/consul/1.17.1+ent/consul_1.17.1+ent_linux_arm.zip"
    sha256 "35f05983b1c7cf91c70ddd0618c199c65fd679bc4a827048cc45526368f9eba7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/consul/1.17.1+ent/consul_1.17.1+ent_linux_arm64.zip"
    sha256 "23d79e71d0157e50ff1b2e04590224e382571918de469265ea80dd615a97fbcd"
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
