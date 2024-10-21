# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.1+ent/nomad_1.9.1+ent_darwin_amd64.zip"
    sha256 "4685a0bca5799f7255ecd601a753d33f3e91225a8e67c3b2bf70dbace7933e8d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.1+ent/nomad_1.9.1+ent_darwin_arm64.zip"
    sha256 "253e6a6b28be3ed9cd0c4fa9a193e545061bb019d57fe45b7256fcaf2d652bd9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.1+ent/nomad_1.9.1+ent_linux_amd64.zip"
    sha256 "9b6b7398ef651b2f27e4ea5b0bb73c9781c2f9fedeb94c001fe0092c4a608be1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.1+ent/nomad_1.9.1+ent_linux_arm64.zip"
    sha256 "7efdc6ff61acf79642f543c929fecd8661d7a467f5038f8c389b29d5d2c8cfaa"
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
