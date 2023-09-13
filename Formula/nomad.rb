# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.2/nomad_1.6.2_darwin_amd64.zip"
    sha256 "b9ead8616cdb812628bafe33b2061305c58d5189666f96c83640fadccd1e0920"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.2/nomad_1.6.2_darwin_arm64.zip"
    sha256 "a45b015c01ad96631dad83959c1533d64afa0414a2de92d3b3166ba8180656a9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.2/nomad_1.6.2_linux_amd64.zip"
    sha256 "f6f879a359a667a6b1ca4366abd8383d89118dabd0d28af5bbc4721685ff17b8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.2/nomad_1.6.2_linux_arm.zip"
    sha256 "597b902624c56d46ac0279a5a596ee840ac0ddf9f7709c8aee987ab187c241a5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.2/nomad_1.6.2_linux_arm64.zip"
    sha256 "799c2af0366bf37edfe5b63f068e02b22394cb1406c2cf8150b484cce8c799f7"
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
