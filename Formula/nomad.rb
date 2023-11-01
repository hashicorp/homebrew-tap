# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.3/nomad_1.6.3_darwin_amd64.zip"
    sha256 "fa1c704df154e06253dc25b4243c59e36e6375c58112a3bcd52b0e0b60e502c0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.3/nomad_1.6.3_darwin_arm64.zip"
    sha256 "5a5fead71a53674039c1046419ebb57a173d5f370e58e5a121770591d07248d9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.3/nomad_1.6.3_linux_amd64.zip"
    sha256 "1771f83030d9c0e25b4b97b73e824f4b566721e3b9898ae9940eceb95bb7f4d0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.3/nomad_1.6.3_linux_arm.zip"
    sha256 "9775201eb701a10630d5400258ed08c3563eb63cae9a36db3f6790c2cc3e278d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.3/nomad_1.6.3_linux_arm64.zip"
    sha256 "1b85902b62fcaf992c98f6c3970742608c919d2d2e8db59933702859600b866e"
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
