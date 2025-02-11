# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.6+ent/nomad_1.9.6+ent_darwin_amd64.zip"
    sha256 "66210bbeee734c2c7d40dfaa2d5332ba2ad3e99d95d4becbbd0a852bf529e88e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.6+ent/nomad_1.9.6+ent_darwin_arm64.zip"
    sha256 "3fb85938cbd6273764e7a34a4af7b84159afb3225f728faa9ab69e4fef7a0a04"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.6+ent/nomad_1.9.6+ent_linux_amd64.zip"
    sha256 "533823e57bd9b90d0948e6eea41847e4b44627456b5cd06b725fff9d0535066a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.6+ent/nomad_1.9.6+ent_linux_arm64.zip"
    sha256 "cc8ba9b1506680ffdf808cc64b48ae0e85bcebec431fa777968c9c2c6e459d2f"
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
