# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.6/nomad_1.9.6_darwin_amd64.zip"
    sha256 "c562551973c497a7c8fa45c934c058dce9772357b4efcc9f786a765c6087544e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.6/nomad_1.9.6_darwin_arm64.zip"
    sha256 "74de7f799ca08dd675c42f944456c47ee02e9046f3729fc0e28717c9d2b176a2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.6/nomad_1.9.6_linux_amd64.zip"
    sha256 "2a34f08154e5ac72c43bfe56bec1836028c5b3fff3468915a9cffcf6cd2cdf52"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.6/nomad_1.9.6_linux_arm64.zip"
    sha256 "8e1c4fb14c90d60efe0e81f04968f90022d7f3f945668f445d9186bd2120ac48"
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
