# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.37.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.1/consul-template_0.37.1_darwin_amd64.zip"
    sha256 "b811c3bff5f02a5f4cc5e05c8cbc3fb7d620e4de7ff5f61f61b2d49a8759d339"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.37.1/consul-template_0.37.1_darwin_arm64.zip"
    sha256 "72182df04629f4eb440788aca739203911279451c93f8ed35020b1eefc54dc52"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.1/consul-template_0.37.1_linux_amd64.zip"
    sha256 "dcd0c4e907855dc8d605d55574e8532fb7c9664392503d0507823e543c4624a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.1/consul-template_0.37.1_linux_arm.zip"
    sha256 "f730de93babf661f2e14b386b99bfb78bb587cdc3efbf387d7bca906786d39ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.1/consul-template_0.37.1_linux_arm64.zip"
    sha256 "4c1f380afd2499702ba6a0546efddfc85ee915313080fec1a95aeb4093e3b0ef"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
