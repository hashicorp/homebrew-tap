# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.0/nomad_1.7.0_darwin_amd64.zip"
    sha256 "99d88f3f3e0fe28fcbaa2ba92fdc4ca9c532677bf2d4eca9dc8ae96fade7bb19"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.0/nomad_1.7.0_darwin_arm64.zip"
    sha256 "193a0c6ca6a23a8d6db0dd7233717242526f2257e9505c22d757e33161f57df5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.0/nomad_1.7.0_linux_amd64.zip"
    sha256 "b0881b2e60f8acb97751bc1aac470d4f60ceab430ef572e12c7dadf1037532bf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.0/nomad_1.7.0_linux_arm.zip"
    sha256 "33f8a769f2ef886392cb80945769f2d8a68b6ca31b1b4b5432433ee5063a6cc2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.0/nomad_1.7.0_linux_arm64.zip"
    sha256 "7db8f97ef8901e6717bbff09c7f3521355af6c3768666c0cb1d2e572e9d511e1"
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
