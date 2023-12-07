# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.6.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.4/nomad_1.6.4_darwin_amd64.zip"
    sha256 "88d382cc4b1b81e3794589fa5f9f57483031c6eb049229775c85b25e900bc288"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.4/nomad_1.6.4_darwin_arm64.zip"
    sha256 "2c9f15fc3c0dddff50a33673c926106f31dbb47d7a3e8ca32e2a0d1957ab2dca"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.4/nomad_1.6.4_linux_amd64.zip"
    sha256 "0ad53829d9d4ea56b7d0c4638311d91eb7dbbadd4862389b1639066f23b812c8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.4/nomad_1.6.4_linux_arm.zip"
    sha256 "4283518840975ecdb24f97d2d034cad55c2e80f869a8eaced4ce41cae998b622"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.4/nomad_1.6.4_linux_arm64.zip"
    sha256 "4965266c71218450f6affdeb034e0dba66f907f7b1dc6e5b86c97d29a92295ff"
  end

  conflicts_with "nomad"

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
