# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.11.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.4+ent/nomad_1.11.4+ent_darwin_amd64.zip"
    sha256 "1874345dab32266078ddacb8d910a46b5b2e8474164e1888e4c36b5d1ea5dd63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.4+ent/nomad_1.11.4+ent_darwin_arm64.zip"
    sha256 "55d1e54e7bb6b999b7ddf2c169d5d5e30f1e27be4e3e5bf3fd0158ac8446e454"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.4+ent/nomad_1.11.4+ent_linux_amd64.zip"
    sha256 "7c5c05cf955f1f4bf66d27b48dab84163ecb4618ac6eada762311807d37d4113"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.4+ent/nomad_1.11.4+ent_linux_arm64.zip"
    sha256 "72420931007ba8310f74797f12aba83237a596ef5c5d244809c0c5ce9c231b11"
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
