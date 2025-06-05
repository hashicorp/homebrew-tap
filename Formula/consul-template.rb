# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.41.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.0/consul-template_0.41.0_darwin_amd64.zip"
    sha256 "241c4fbf3618c63854b4fb293351905f1c212adfd3cb98e55387b214a2a19319"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.41.0/consul-template_0.41.0_darwin_arm64.zip"
    sha256 "668ac157fc44733c04da60a70107fdc577dead025021e26897bbc47e6a3fb6d0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.0/consul-template_0.41.0_linux_amd64.zip"
    sha256 "64e732cdd75a778ea6a5e16b32792a1effc88963d37e73f0088a115ea790938f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.0/consul-template_0.41.0_linux_arm.zip"
    sha256 "3f34b1edb45122d27b36b301696dbb6a422f9b7f2b562ef22ab150569c351694"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.0/consul-template_0.41.0_linux_arm64.zip"
    sha256 "1c4b00b9959324a72811770a8bf8a9717df41b7fe69eae4dc8f75ba183a99f71"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
