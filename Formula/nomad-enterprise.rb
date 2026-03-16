# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.11.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.3+ent/nomad_1.11.3+ent_darwin_amd64.zip"
    sha256 "c2ebcbd65f391944c6741a68a2928e6d1f86b0e1572f759d1aa13fec1b0e7af5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.3+ent/nomad_1.11.3+ent_darwin_arm64.zip"
    sha256 "8d47f402981b51e56807f6c4ad5ac174ce63226f0265b2b1c3615b653248d188"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.3+ent/nomad_1.11.3+ent_linux_amd64.zip"
    sha256 "a567ce7647217066a1de0f2b3f6c616faed48bd0b059eca701d806b33b8ee51a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.3+ent/nomad_1.11.3+ent_linux_arm64.zip"
    sha256 "32cf5c683293f0b970813b8a3b8cc692a63e6a296e8606d996b1e3f532b41c87"
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
