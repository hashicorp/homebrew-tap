# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.6+ent/nomad_1.10.6+ent_darwin_amd64.zip"
    sha256 "c38ba56b3b1259bc9eeacc79da5a45b4a95ff020ec815a2b83a53cebf0d023be"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.6+ent/nomad_1.10.6+ent_darwin_arm64.zip"
    sha256 "cbc7a932329433a045332c34428bbb1a7fded9f4381cb125d3004fa97869a5e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.6+ent/nomad_1.10.6+ent_linux_amd64.zip"
    sha256 "1b710ad5e6093601d092317c64e68b0d3f684950d6d06be340b505df0836b701"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.6+ent/nomad_1.10.6+ent_linux_arm64.zip"
    sha256 "ecb0066e65b1f2d2155d9f7f8bc50ac81f3912122512e78a51fcca6ad05d19f9"
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
