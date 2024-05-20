# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.2/consul-dataplane_1.4.2_darwin_amd64.zip"
    sha256 "49e3369a0d4ae0d447889f383b33e3ce033ae55c6339e47d2016b8ea35374b6f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.2/consul-dataplane_1.4.2_darwin_arm64.zip"
    sha256 "0ce110e210240cf06bc29a7aaf74a2c454ee76f93a6f14954c1b35cddbec208b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.2/consul-dataplane_1.4.2_linux_amd64.zip"
    sha256 "fb085b2a1ecdcbed3bbd636ecbb9f35db692ac3388f9caafb766932e175512cb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.2/consul-dataplane_1.4.2_linux_arm.zip"
    sha256 "f0217f50ce44d6de361ff4a5f3c303869cf40037b1aa8e89484a7bed0226feac"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.4.2/consul-dataplane_1.4.2_linux_arm64.zip"
    sha256 "23623c1e733d420684ad0904ba12408b87c9b74bcc349d4828b1d8d1f2783dde"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
