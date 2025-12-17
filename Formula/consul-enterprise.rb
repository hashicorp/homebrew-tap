# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.2+ent/consul_1.22.2+ent_darwin_amd64.zip"
    sha256 "4f89710bcbfa87583250f49f00921de3198c293a47c2e588daebb5117cf7f62a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.2+ent/consul_1.22.2+ent_darwin_arm64.zip"
    sha256 "3509addda6b9bf55999c89571c4d28af5987038cf7c65f99d7c4d02400c22aad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.2+ent/consul_1.22.2+ent_linux_amd64.zip"
    sha256 "74306c39823e1be11e5968ce3856c21b9fca748d92f9a55e8db72d2c21cf1991"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.2+ent/consul_1.22.2+ent_linux_arm.zip"
    sha256 "7fe8e2bf8bf08f03edfeaed2d80bdf09863e065fe09ea5952205570e64c793ef"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.2+ent/consul_1.22.2+ent_linux_arm64.zip"
    sha256 "04aab6dc4c1dee4d1c75632125eeb973825f4ab3973c066f89e8bcea9054b31e"
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
