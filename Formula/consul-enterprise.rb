# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.17.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.2+ent/consul_1.17.2+ent_darwin_amd64.zip"
    sha256 "0d7621895892fb9906a68c81364aaced9e4d85c3c0087a290a932f2159afa8eb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.2+ent/consul_1.17.2+ent_darwin_arm64.zip"
    sha256 "781d2a4524fa222ab0df262efb7b94f7dc515a2d2a1a71b23ba0e0562896fdfc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.2+ent/consul_1.17.2+ent_linux_amd64.zip"
    sha256 "082e22ff22f642c0064a48ec0edea935450f51dbc7e2910fa7d455c2a92df3bf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.2+ent/consul_1.17.2+ent_linux_arm.zip"
    sha256 "6a5b4196006f9b88f5a4e965beff5a0aaea664f590edd9e6de348c58269d1ebe"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.2+ent/consul_1.17.2+ent_linux_arm64.zip"
    sha256 "8ad327cc420afd65ea1774993914f5aaad47eb5cfc111f319874a34a93cd82af"
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
