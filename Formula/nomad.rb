# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.4/nomad_1.5.4_darwin_amd64.zip"
    sha256 "96330e3a4530fef6b3213c678c4d24bebf2d2719285824ab104099d32128bd9d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.4/nomad_1.5.4_darwin_arm64.zip"
    sha256 "5618dd6e8ae6e89513033c1d5becb59ebd529d810b7db50ed3544f2b2a8bf956"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.4/nomad_1.5.4_linux_amd64.zip"
    sha256 "c15ffd6a79925ea363d569028189bec8d8eb81c2a2e0c85afac2405d785ec9ef"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.4/nomad_1.5.4_linux_arm.zip"
    sha256 "5bbcc429fa081c1b089eb91bc6f426ee64202f6452abc6698f7b264bb0ebe04d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.4/nomad_1.5.4_linux_arm64.zip"
    sha256 "78a02ae33d5cf2e68766948682a2a52410d87d9c08719642d36e3f3f3d730b01"
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
