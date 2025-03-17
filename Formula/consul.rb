# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.20.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.5/consul_1.20.5_darwin_amd64.zip"
    sha256 "8eb12717124944f3177a4de8fae265d173c60c7219728fe9fa7dbbb3100f3567"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.5/consul_1.20.5_darwin_arm64.zip"
    sha256 "1bac78ed8a2ea869e227f9503db4fa2b04f90e4b7e8f19a285475a338d8dd755"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.5/consul_1.20.5_linux_amd64.zip"
    sha256 "75132816072b3c7da86f04153fc58fcfcf39abadee5279b3f72bec3cce01a16b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.5/consul_1.20.5_linux_arm.zip"
    sha256 "79ab1605fd073a986304aee42f533a8528770dbd7cae4ae3721e33e5c0f05844"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.5/consul_1.20.5_linux_arm64.zip"
    sha256 "e6bf36bc8ae110c2a2594e7713ed7bd7828851dc869e35d042a7c36620bbbbd4"
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
