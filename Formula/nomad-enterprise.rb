# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.11.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.1+ent/nomad_1.11.1+ent_darwin_amd64.zip"
    sha256 "c48540f0dc5e4e779e55df717ba4a9cbea77e437e43906aa001a62ddb8a01cf9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.1+ent/nomad_1.11.1+ent_darwin_arm64.zip"
    sha256 "9d36ef39efccd31df8afc0f7c6a8445aa939fe104fdf8eb3e3bf223c1cb6e092"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.1+ent/nomad_1.11.1+ent_linux_amd64.zip"
    sha256 "8982cf7c5c06d457e85b6b54d6179f3dcdaff0d9831f080892841114cd594405"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.1+ent/nomad_1.11.1+ent_linux_arm64.zip"
    sha256 "fb60dad12311d75210f0e171fa207271d1556a70a3028a0e2fe6fa49060e2b3e"
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
