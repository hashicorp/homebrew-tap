# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.5/consul-dataplane_1.9.5_darwin_amd64.zip"
    sha256 "29a402b0c69203c608998fe124b31f104485c362ac0fc5d97ffd0ccb07bb22fa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.5/consul-dataplane_1.9.5_darwin_arm64.zip"
    sha256 "b2c39e83055a908f762ae3268a038a52b05e6b8f735cac26116e4b72fb0cc117"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.5/consul-dataplane_1.9.5_linux_amd64.zip"
    sha256 "4ce92c284bccbb8f05beb7cadb67f4775ab692c42c82a314338ea51ad414bec9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.5/consul-dataplane_1.9.5_linux_arm.zip"
    sha256 "1200dae369183e643dd977ce891fc73a9002063a63826bf8a1c70333e843f3e9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.5/consul-dataplane_1.9.5_linux_arm64.zip"
    sha256 "3c254b0ca6e7d773067d49867e30b9c46ed9a1417e8207a713a674c10090d884"
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
