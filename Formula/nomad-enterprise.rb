# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.1+ent/nomad_1.10.1+ent_darwin_amd64.zip"
    sha256 "860612a4f85e9989726082d92c7e106c50ec27a5cde468518d31dc4d80403940"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.1+ent/nomad_1.10.1+ent_darwin_arm64.zip"
    sha256 "76374c6400cee0ea566526e39deb6d1d17362fa02eb4fae74956eb3bba458a59"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.1+ent/nomad_1.10.1+ent_linux_amd64.zip"
    sha256 "e24021bea9b463037332dbf91418307d1019bf8e7f93405bd28602cb2eb6cdc0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.1+ent/nomad_1.10.1+ent_linux_arm64.zip"
    sha256 "62f419ea7f05a1e545e848536b2e187e98954f8ec3b188c006e3e6357e2aaf8f"
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
