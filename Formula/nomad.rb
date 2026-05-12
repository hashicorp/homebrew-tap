# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_darwin_amd64.zip"
    sha256 "5bcf1bf5286715b286c827e228e35b74950d540f86874bac9da8ecc6dd8fc741"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_darwin_arm64.zip"
    sha256 "33b987a15ac4e0936357b643b141ecbb055ac03a5d0e90a8df9677bc14349f31"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_linux_amd64.zip"
    sha256 "cf5d820b5dc3fcd1ceb8baf3afab46e3a52a56fc3016fcdaed0505f531a39540"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_linux_arm64.zip"
    sha256 "7fd283c236ebf3df3501350dace8aa7d3cb28e804058d01e0cecda76c5a4b585"
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
