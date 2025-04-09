# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.0+ent/nomad_1.10.0+ent_darwin_amd64.zip"
    sha256 "3b81b6f0b4207cf4a4d060a8167b291272e7a6f607ea7a448698b691658405b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.0+ent/nomad_1.10.0+ent_darwin_arm64.zip"
    sha256 "75ca96e9272b1ed4357e85bff50242e6f06056aac0320bb488a07743d5099983"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.0+ent/nomad_1.10.0+ent_linux_amd64.zip"
    sha256 "d599bbe69c1373170d1798c332f74021447d5167428a70225fd10cdc2c5fd50b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.0+ent/nomad_1.10.0+ent_linux_arm64.zip"
    sha256 "1f886ce27c797baccfe9f88c3753f7e0c6ba468c23a05884cf17b894ab9222a4"
  end

  conflicts_with "nomad-enterprise"

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
