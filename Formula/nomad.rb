# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.1/nomad_1.7.1_darwin_amd64.zip"
    sha256 "dd2f9a5a8d05c6baef18b3a838b959d2cc5d569d27c0f8f11721a1e062205832"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.1/nomad_1.7.1_darwin_arm64.zip"
    sha256 "11a3b3f550b56514c11d70defccfec3b8e9bc8712101521417d114bc13af2f0e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.1/nomad_1.7.1_linux_amd64.zip"
    sha256 "c58ca66ad3d6f7bbdaef8895deb47ac591187fa101b7eb9be6d3815fcfcea364"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.1/nomad_1.7.1_linux_arm.zip"
    sha256 "5c983cf1d03cf51fb3b6644fc6edc53f0ab9fa240f3938d006b50fddfcd485e8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.1/nomad_1.7.1_linux_arm64.zip"
    sha256 "6252c268133662491e25b629413e6df401cd608a56af4a8863d29abfb596e978"
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
