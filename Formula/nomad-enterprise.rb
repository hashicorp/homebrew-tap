# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.5+ent/nomad_1.10.5+ent_darwin_amd64.zip"
    sha256 "9c7eb699c85e45f195cf9b04576c5dc54bd345093ce125904fee8be72afc7a8f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.5+ent/nomad_1.10.5+ent_darwin_arm64.zip"
    sha256 "63ea05cc2ad029ccebe29bcd4fd18bcbe728188973589933191f99e8ca0dd9af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.5+ent/nomad_1.10.5+ent_linux_amd64.zip"
    sha256 "0c570a96612042344aae9ce538ad12c7ff6412fd3fa2fbf2086eaffaef05efb1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.5+ent/nomad_1.10.5+ent_linux_arm64.zip"
    sha256 "69cc09406681dfe42214f23f9d155810f11adea20b87eb40a28d83006137ff93"
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
