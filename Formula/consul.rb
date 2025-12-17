# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.22.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.2/consul_1.22.2_darwin_amd64.zip"
    sha256 "87ad3967d78768516497b78d7297544b8cceca7cb4d1a8d676b9453e6bfcaf46"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.2/consul_1.22.2_darwin_arm64.zip"
    sha256 "c820f31ae10b6a0dea43806d2e2faa071f9ffe5a8adb6fec7d7fdd16b8b030af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.2/consul_1.22.2_linux_amd64.zip"
    sha256 "e9ad339128e396238f053269bf8f76aeba1b5fada6f6cb60ab19fe70e133acde"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.2/consul_1.22.2_linux_arm.zip"
    sha256 "2c5bfcc7691918b1b9884f5d7d77de2d7ae1ec91f6ba2169299e26d83de5b02d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.2/consul_1.22.2_linux_arm64.zip"
    sha256 "d33ae72ac71b8b6a3932d246d617e810bd107306814584f2fb56a70f2aa683e2"
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
