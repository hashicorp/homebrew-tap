# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.0/nomad_1.9.0_darwin_amd64.zip"
    sha256 "43bfb0925fa83880da7cf4aa4b3b8d8126934fcb34422ad233620ef0fad72289"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.0/nomad_1.9.0_darwin_arm64.zip"
    sha256 "7177c03fe226427691d92ecb48dbf27fa124dde715fe972cb6d073659d3426e3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.0/nomad_1.9.0_linux_amd64.zip"
    sha256 "b16f46cef003a8f16819697574df018becd1f033a8ca89a0cb431ef151bcda1b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.0/nomad_1.9.0_linux_arm64.zip"
    sha256 "374ca019b087f8c47d83c16894819874d5c51a5272cb951f5924a35dfee81fff"
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
