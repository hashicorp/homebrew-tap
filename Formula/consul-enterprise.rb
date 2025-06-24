# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.2+ent/consul_1.21.2+ent_darwin_amd64.zip"
    sha256 "f81f6cb7d7b7ab7bf66e09c9acc58e6b3c4ae594d770a388db927bcf26194397"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.2+ent/consul_1.21.2+ent_darwin_arm64.zip"
    sha256 "1308c845c81e02a23985e2d52924accde2d6122417862c230d8581029f638322"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.2+ent/consul_1.21.2+ent_linux_amd64.zip"
    sha256 "29a51237a623f75023254aca552ed902766426e5daf696fda4477a435b495533"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.2+ent/consul_1.21.2+ent_linux_arm.zip"
    sha256 "938d1c7142cfebeda22937e0c454da747c680ce548173566d4c04a8769d03d66"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.2+ent/consul_1.21.2+ent_linux_arm64.zip"
    sha256 "333254d763010274ee44493039fd42ce2a67859827f81303eca571ea8fee9f11"
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
