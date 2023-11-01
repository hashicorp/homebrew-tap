# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.16.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.3+ent/consul_1.16.3+ent_darwin_amd64.zip"
    sha256 "c6706ab970e063096023dafb4036666d5a35d464cfd3f59460fddb115380d654"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.3+ent/consul_1.16.3+ent_darwin_arm64.zip"
    sha256 "dcaffe79751ea2a59584f990e3e90a9f897cbea576d97b60617c104258b03ea5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.3+ent/consul_1.16.3+ent_linux_amd64.zip"
    sha256 "842dea2649e0bc0c5e79a7e83c01b28e33dccbd7c90c0a6f08cb2cbaef1556cb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.3+ent/consul_1.16.3+ent_linux_arm.zip"
    sha256 "de5bc0480e77f2fabcfff2eb9ba26f5e5513e33b1cda0e4cf7c8c86669b2a09b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.3+ent/consul_1.16.3+ent_linux_arm64.zip"
    sha256 "79fd72c3b61712f205c5e3d32767a47c072155cbe3e6707ef3f3cee9b95d84bf"
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
