# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.2+ent/nomad_1.8.2+ent_darwin_amd64.zip"
    sha256 "943985f952571b59f0234ab29d8aa369b8ec21e6fa464f7644d47624fbfac540"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.2+ent/nomad_1.8.2+ent_darwin_arm64.zip"
    sha256 "92f03965768139fc91f72424eb4c2f6063f3fbbbf354a377125f97fef9e69330"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.2+ent/nomad_1.8.2+ent_linux_amd64.zip"
    sha256 "97cc16420adb44d238ec50eace88ca7975d44c3cc3d519ad5deb0177391e0ade"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.2+ent/nomad_1.8.2+ent_linux_arm64.zip"
    sha256 "e7c7b1b815bd44b9f061bf576fd94b2d2a5db09b58b178a4aca06e21675723ed"
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
