# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.4/consul_1.15.4_darwin_amd64.zip"
    sha256 "81abcb80050dc68d26f6a1c0a452aa2fdc26490a9ff3f093970a32335b33bb64"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.4/consul_1.15.4_darwin_arm64.zip"
    sha256 "8132503a6a07bd26c45ac90952647f287c01fdabc57cfdc5bd494b9ef20e95e4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.4/consul_1.15.4_linux_amd64.zip"
    sha256 "f0d683ec9589884873f12a71dfb2fe0a03f0440f9d63bc30676f397919184c9a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.4/consul_1.15.4_linux_arm.zip"
    sha256 "289355fe7ac96d6851ac93d21d7ab27f7a4bfb42207f816149767b7333f98321"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.4/consul_1.15.4_linux_arm64.zip"
    sha256 "d1404acf8de2fe662c479cfd3b5277e1da6ffc89fdd7b883ec32633941216daa"
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
