# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.2/consul-dataplane_1.6.2_darwin_amd64.zip"
    sha256 "57c151e4ff65e10b9abea9f59f036323fb698cf3c684f2365e5dbdccf84045f2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.2/consul-dataplane_1.6.2_darwin_arm64.zip"
    sha256 "494393528c85739771bb240250cdd7f75adcf35cd0306dd57befacf8d19c75aa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.2/consul-dataplane_1.6.2_linux_amd64.zip"
    sha256 "f6173b56f2250b904ff7dc4be243c97ea0378be2123a2249ba57c8dd6402bb4b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.2/consul-dataplane_1.6.2_linux_arm.zip"
    sha256 "4bd81bf021a394f1063e99eec6f0cf5ea1c105280eb5780fa8ec128f55a45803"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.2/consul-dataplane_1.6.2_linux_arm64.zip"
    sha256 "e53c7cefbcd54804806764d142a302a150141b69873ef21717ba455929653ae0"
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
