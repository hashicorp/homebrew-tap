# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.3.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.3/consul-dataplane_1.3.3_darwin_amd64.zip"
    sha256 "93ec0c55be5f022adf453075e82c10d727bfba58d427589f9e9a7701ec1487a9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.3/consul-dataplane_1.3.3_darwin_arm64.zip"
    sha256 "2b601a76c99e54a3ddeb8f985aca25f07fdb83d0b1cb79ae0c7913c5cd357938"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.3/consul-dataplane_1.3.3_linux_amd64.zip"
    sha256 "69f71982158a697c8fef5e325395e1132d2278c42aa11cda23690ab5de64e164"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.3/consul-dataplane_1.3.3_linux_arm.zip"
    sha256 "568f395fd7731fa79b439aaa573db4861681ec1c20114bb4abc1b329b3a6088f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.3/consul-dataplane_1.3.3_linux_arm64.zip"
    sha256 "e0e9e2dfa7c8416cdac577f7141887d1e0ed688f71c288bb3b98f57e3489e34e"
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
