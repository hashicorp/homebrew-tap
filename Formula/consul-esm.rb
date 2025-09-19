# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.9.1/consul-esm_0.9.1_darwin_amd64.zip"
    sha256 "cdf0c9e7ba7a1381fec15665a2bfae5779ed0b3fc9021b3f9d34006fd1a67dd3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.9.1/consul-esm_0.9.1_darwin_arm64.zip"
    sha256 "47eca13f82017313585010c08874796dffd165fd50fe96b6935352e8320deab3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.9.1/consul-esm_0.9.1_linux_amd64.zip"
    sha256 "50d9367be90f542f659bbba9d8ec3510516d995dbb2f522c8618ae75fff31757"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.9.1/consul-esm_0.9.1_linux_arm.zip"
    sha256 "12b7aa33777d2230a546152ffb7ffc2fa30c67539c6a5e565d99199d44c9c015"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.9.1/consul-esm_0.9.1_linux_arm64.zip"
    sha256 "a8a158f4cb45413abbf082cf3fbe6073e13e3f8eb3eef02328fa554740cf2633"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
