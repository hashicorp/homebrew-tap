# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.2/nomad_1.8.2_darwin_amd64.zip"
    sha256 "81cde80eec0183a5b0430853c6aba4b05716fc73c32e58c6082c89dd1fb75656"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.2/nomad_1.8.2_darwin_arm64.zip"
    sha256 "cd7d3e41c856aa5127b5562f5b0e1717d205bb6902e7054bbdbf32598821b434"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.2/nomad_1.8.2_linux_amd64.zip"
    sha256 "75300292073874e4051b9c135009c827b120375d15846427cc4954fc0400d2d6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.2/nomad_1.8.2_linux_arm64.zip"
    sha256 "f452234e3192feaccbd78a684b62a93f97dea88bfcf528ea87587971f3be325a"
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
