# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.6.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.3+ent/nomad_1.6.3+ent_darwin_amd64.zip"
    sha256 "5b38c6ac5e65b5e11bac0d92bb44658bd043ec6b82b5709eece8aa979d215509"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.3+ent/nomad_1.6.3+ent_darwin_arm64.zip"
    sha256 "965fb1a852cd705cacfcbad512ce4ff823a93b306abadb208994cd5eb59c4eac"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.3+ent/nomad_1.6.3+ent_linux_amd64.zip"
    sha256 "af8a796101e7aebc79280a06690e6a2e3ea6d1779c0e81a294646c23c507f7fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.3+ent/nomad_1.6.3+ent_linux_arm.zip"
    sha256 "1ef3024224f1c40b896369df21dbcfa05d3f3fa890f3fe0b9e080783d102b7c0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.3+ent/nomad_1.6.3+ent_linux_arm64.zip"
    sha256 "be0988505d674af02aaa3a18a9306fffe878492cdd24c8b2543583d831db33b2"
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
