# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.0/nomad_1.11.0_darwin_amd64.zip"
    sha256 "a9f92b7b624a518382f2c492c1b299ba219a2afe955b88fa1e383f788e598978"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.0/nomad_1.11.0_darwin_arm64.zip"
    sha256 "ff710bea95bf294167cdf0e1ae4a1ec6d4283a1f35abef544b4b708eb12d5b42"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.0/nomad_1.11.0_linux_amd64.zip"
    sha256 "ea4beab31494b810f40e8b2ed5fd74950348546879570780406e6647363e32ba"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.0/nomad_1.11.0_linux_arm64.zip"
    sha256 "f6ea3bb94bdee15bd0d853a68d6212dc7aa42b78476ddee33667205378edae99"
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
