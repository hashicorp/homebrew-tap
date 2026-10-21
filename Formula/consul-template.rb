# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.43.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.43.1/consul-template_0.43.1_darwin_amd64.zip"
    sha256 "42f334d635c306616e30cc21b2615fbd451d01b512a083a7c47443492503a222"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.43.1/consul-template_0.43.1_darwin_arm64.zip"
    sha256 "bea40f5fb22b82a37d589c89c47891871151a08370ff337db218b003f8eceef8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.43.1/consul-template_0.43.1_linux_amd64.zip"
    sha256 "4f3afadcc6612abf55ae7c9c3328955bfeb43becffe15d2972acf0e0a194c339"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.43.1/consul-template_0.43.1_linux_arm.zip"
    sha256 "a5e1953296c04c6894df90769c467bf8fb3a2da84648d1b38e504d2ab0d30fee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.43.1/consul-template_0.43.1_linux_arm64.zip"
    sha256 "db50e5e26ad8f8e077eae85e0e79bfc5f6f54a8f8999ea9a539e2b17bf9ab657"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
