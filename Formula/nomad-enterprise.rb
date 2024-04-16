# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.7+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.7+ent/nomad_1.7.7+ent_darwin_amd64.zip"
    sha256 "12481542a0d1b0ee860ade3d37f47782817e13573202dad77c776e34801b4be3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.7+ent/nomad_1.7.7+ent_darwin_arm64.zip"
    sha256 "add950f8305b46ccbfb45258c8593d18b85e578c4188f234c4d2fb862c199685"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.7+ent/nomad_1.7.7+ent_linux_amd64.zip"
    sha256 "cfde34ab2a300cd9413d16e89526cd622e60389c32d530cb589e61206d6ed957"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.7+ent/nomad_1.7.7+ent_linux_arm.zip"
    sha256 "8f49e87f2d81cdedaac88f933d512556dbdeeca083885be68ab1c84938a7956e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.7+ent/nomad_1.7.7+ent_linux_arm64.zip"
    sha256 "dc9d745f324a2318b3548a0a49fa2d0d6d9a38c9b8efe25616f9ee67e1750492"
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
