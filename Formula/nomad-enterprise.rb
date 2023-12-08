# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.1+ent/nomad_1.7.1+ent_darwin_amd64.zip"
    sha256 "478a3885bbdb9727c859b78060bc48b16807ddbe2eaf94d5ccce068a70c1d9dc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.1+ent/nomad_1.7.1+ent_darwin_arm64.zip"
    sha256 "861d91895d5c43a8d5a52f0470d3195bf69d1c5c90ee4576e74ca91c046c9f9d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.1+ent/nomad_1.7.1+ent_linux_amd64.zip"
    sha256 "6cde91a9ed7cc6537a3813140a94f7d5226e676defca9c9e2c7ce089d0570b3f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.1+ent/nomad_1.7.1+ent_linux_arm.zip"
    sha256 "15159e42fc2e3fea8a93bc94b89b5fac6b0713f1580e4fe4e8005e5aaf9e7696"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.1+ent/nomad_1.7.1+ent_linux_arm64.zip"
    sha256 "3389b18e2eb8ee5971090df21bead89230082d16bc595cc8397a55d7e53f9b86"
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
