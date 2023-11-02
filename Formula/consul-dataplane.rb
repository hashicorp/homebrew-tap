# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.3/consul-dataplane_1.2.3_darwin_amd64.zip"
    sha256 "7957ae0e4cbf88e60f41d5e3367007ada71d204a4d209857541ac0066539dc71"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.3/consul-dataplane_1.2.3_darwin_arm64.zip"
    sha256 "6956f8d1fe65fef11cc7b3348cfc06a89a39e2d1539e6927e6db455752768db6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.3/consul-dataplane_1.2.3_linux_amd64.zip"
    sha256 "8468e7af2b8364cdeee6171b9dc9694e5cff891e95900b5873ef6675f97cbbd6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.3/consul-dataplane_1.2.3_linux_arm.zip"
    sha256 "7f73fbbca716b33b14564f71feac6b49e4dbf61aebebea594cecf1e686123fd9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.3/consul-dataplane_1.2.3_linux_arm64.zip"
    sha256 "9de86fdf6a92274a15a84c288dfca828a1d9c062e54a2adadabcbb71e8e49e96"
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
