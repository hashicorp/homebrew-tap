# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.10.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.4/nomad_1.10.4_darwin_amd64.zip"
    sha256 "8b5e075f758e78982bf9baf6113857fa552c1daf1fb33e875f2e453f5922296f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.4/nomad_1.10.4_darwin_arm64.zip"
    sha256 "06f18ed96407baa4164176a7abddb5851680ac36d889616c202c098aed490d11"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.4/nomad_1.10.4_linux_amd64.zip"
    sha256 "33f50ef9a56ceb995768a1301c7bc73d9270fd751378de5b3cffcf21af9112a2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.4/nomad_1.10.4_linux_arm64.zip"
    sha256 "ebc53a0c232d251f8428d3af45400677c72ec530cc93042d95c60bf34e020169"
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
