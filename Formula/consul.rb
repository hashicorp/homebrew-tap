# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.22.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.7/consul_1.22.7_darwin_amd64.zip"
    sha256 "4c768e809905e4ea1869a956e307d6311ebd592888f1dba2a2fbd72bcfe4f18e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.7/consul_1.22.7_darwin_arm64.zip"
    sha256 "6356b66f92f81d20e13129b09cdbacae7179952b7285e22f8ef8f8dffbf49758"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.7/consul_1.22.7_linux_amd64.zip"
    sha256 "fe25cecd8dd3552a8e5b0941cde1d79bb6004eac384aa45679dd1398f947201d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.7/consul_1.22.7_linux_arm.zip"
    sha256 "e97106d356f339bb7815fadac2695be2c81195271729bf3c8aa4997e8ba9a776"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.7/consul_1.22.7_linux_arm64.zip"
    sha256 "db54c5fb7c5ceaef97a38ca45dcc0f649ff592a48c73ab320e2d535c78e136cc"
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
