# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.1+ent/consul_1.21.1+ent_darwin_amd64.zip"
    sha256 "d67a46bf18a7999242187fd75bc11b6608367f760e2224a9955e8b169f715405"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.1+ent/consul_1.21.1+ent_darwin_arm64.zip"
    sha256 "bd23529b606db813b43855dba93e62dd37965899cbf3dc8ebd355436b7932659"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.1+ent/consul_1.21.1+ent_linux_amd64.zip"
    sha256 "10402528531d5279276f36e1b7cb3e006c0487521571405c6f7e6eb1624c589a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.1+ent/consul_1.21.1+ent_linux_arm.zip"
    sha256 "c0dfa6351cf2018a03331b1d1a9608b28f8cd0193851c2d87fa9fb22b05fce50"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.1+ent/consul_1.21.1+ent_linux_arm64.zip"
    sha256 "7fba8b6e34b69987dff552ed3cf38776a847ce613f39d5fbcb3194b648f6426c"
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
