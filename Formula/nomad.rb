# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.2/nomad_1.7.2_darwin_amd64.zip"
    sha256 "16c5a5cbccb505972ef2699ae60b8dd411a3ad4a3cebda3add1b15fcef9a8866"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.2/nomad_1.7.2_darwin_arm64.zip"
    sha256 "85e976783ca1acf3965dbdfcb5ea0edd48c594739ecece84461f621e930d820f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.2/nomad_1.7.2_linux_amd64.zip"
    sha256 "5264b4f4b9a0bf8f086544f15e6a6377c856e5556bf44337c958f5356d251331"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.2/nomad_1.7.2_linux_arm.zip"
    sha256 "c81951736cdd3906e84d065ff2f742f424bf0216e8541a4930055a69698f091d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.2/nomad_1.7.2_linux_arm64.zip"
    sha256 "5cdcf9103c8252c83bf1c8540288c3fc2e64b69828beb65395646c76beaff2a0"
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
