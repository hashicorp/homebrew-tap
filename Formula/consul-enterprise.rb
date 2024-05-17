# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.18.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.2+ent/consul_1.18.2+ent_darwin_amd64.zip"
    sha256 "377666bc8e09b517fe9cbaed4904bb784d260d4052296253228f28c919e7342d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.18.2+ent/consul_1.18.2+ent_darwin_arm64.zip"
    sha256 "dc21697031cbf130c1da30c326c74bca91c459ceb05882e47fd96c908071f89d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.2+ent/consul_1.18.2+ent_linux_amd64.zip"
    sha256 "77effe9da3379c1a9fd44368c8a6d4281ad4294cc98053a10b285d521c1ae540"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.2+ent/consul_1.18.2+ent_linux_arm.zip"
    sha256 "8d2c7a1017d57abc0dd585fc203ef5dc1f0e3cdf46a23bccad9b02790312620d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.2+ent/consul_1.18.2+ent_linux_arm64.zip"
    sha256 "ee2e932f762503b89999c8e51db95bad9cbbab77ed3b12c2361f813caaa43c06"
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
