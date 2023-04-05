# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.3/nomad_1.5.3_darwin_amd64.zip"
    sha256 "400f093734754331c327efaab7eb8d3cbf2c91899f9ece2e471f9fd77fd9fbb9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.3/nomad_1.5.3_darwin_arm64.zip"
    sha256 "23044b8fbf1f04612060843ab4392d08b2e29c099418d240a3ac7b559af1c46e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.3/nomad_1.5.3_linux_amd64.zip"
    sha256 "92a1d2d4593d09e0838f7ffc71125494a69951d220ffa1658192c7fbe7034573"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.3/nomad_1.5.3_linux_arm.zip"
    sha256 "cbe6ccf37b9d63665636b753dfb2be31ad8241c92113ec2f4a9d4939e1c67b8c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.3/nomad_1.5.3_linux_arm64.zip"
    sha256 "1e83c11fe58d91aa1e9d4ac2184905464b7602ba2e057dca97f4013225dad8b6"
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
