# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.0/nomad_1.6.0_darwin_amd64.zip"
    sha256 "3a12d4574436e4c2834f0e8ca1d5feec3efd4a7d186db87c0731bde0370f4aae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.0/nomad_1.6.0_darwin_arm64.zip"
    sha256 "1ffcd1c3d50ca04a9049fd018afd5ec8736f56287dfd01708fc7a0614668b271"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.0/nomad_1.6.0_linux_amd64.zip"
    sha256 "c67a4874439b74a25751ebc5549f9873bc9db937d4509403c84e32cef4dae001"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.0/nomad_1.6.0_linux_arm.zip"
    sha256 "36ce530a2f76e8454e3ea24be171712beaa0ae7fac85a7da7d5384df48f872f5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.0/nomad_1.6.0_linux_arm64.zip"
    sha256 "6bc1ef6da1b577c3cd90e2cd89b38aa9f036f0d0dd395d4970fffd29ea5d9292"
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
