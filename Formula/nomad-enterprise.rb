# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.3+ent/nomad_1.10.3+ent_darwin_amd64.zip"
    sha256 "d0c6935309e007c1ce4aa22deb1dd40c9389df742ef33bfa598ac24872e1f5dc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.3+ent/nomad_1.10.3+ent_darwin_arm64.zip"
    sha256 "6549ded4527a97aafe656da2133b5a26beba167264b2b8ecb684b35f616d4925"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.3+ent/nomad_1.10.3+ent_linux_amd64.zip"
    sha256 "926fefcc781880ff95a85caafdb16dd8046b4bad10ff34f60894b54534242a34"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.3+ent/nomad_1.10.3+ent_linux_arm64.zip"
    sha256 "c7195f27f8200152f3f655cbf84131490359c6337ddd8e02a918ed9bada14d8b"
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
