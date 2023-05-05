# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.5/nomad_1.5.5_darwin_amd64.zip"
    sha256 "7d846aceeeebdfb6b75154dfaba24bb6fc1a2507fb535a63c0ae5151dba2bceb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.5/nomad_1.5.5_darwin_arm64.zip"
    sha256 "4c19037c8f9b026a485739935bd8e12bf24da092e10c83cc9d25a6a433f5919f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.5/nomad_1.5.5_linux_amd64.zip"
    sha256 "edbebdf105daf556a1f9e9b40d58eaa6a0984de52ec87c8900687f9d98465b84"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.5/nomad_1.5.5_linux_arm.zip"
    sha256 "c1f81da22631efa4d78a5c8b5ffad699aed1420457fe7682c616ec3b2576697c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.5/nomad_1.5.5_linux_arm64.zip"
    sha256 "0cf6850ab8c6081aa3b6fc9e7b0af8fdc84ff3574d1b6402f1db3e078fe5f835"
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
