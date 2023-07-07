# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Consul"
  homepage "https://www.consul.io"
  version "1.17.1"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/consul/1.17.1/consul_1.17.1_darwin_amd64.zip"
    sha256 "48313acf9093c8bcf2e57a8535c2dd3d036ba435c340d27f56f23d0fabf3b416"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/consul/1.17.1/consul_1.17.1_darwin_arm64.zip"
    sha256 "d727d31c00a247b0c0125ffc05bcd4929c5451ef8ee4e844720d641d237f3081"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/consul/1.17.1/consul_1.17.1_linux_amd64.zip"
    sha256 "388889321d6aaf389ee87acc247ea9885e684a1581c8ebfbeab7348abd7c0214"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/consul/1.17.1/consul_1.17.1_linux_arm.zip"
    sha256 "4cea522a3114c4d7b35ef39fc53a405520b9267691e9a88625559c6c39bf2946"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/consul/1.17.1/consul_1.17.1_linux_arm64.zip"
    sha256 "f36e1add92439cac710f2546beac97f9a6478fab9ff2342f3ce13f72ef2650de"
  end

  conflicts_with "consul"

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
