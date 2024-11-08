# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_darwin_amd64.zip"
    sha256 "fde7dbf9d4bce1e3d60ae274af1e30a96d7119050f146bfe5753c1003f58d0e1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_darwin_arm64.zip"
    sha256 "b919e97481395683aeaa3b119368d4bb8d2a07f351a8b20a4c58db5a94b05100"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_linux_amd64.zip"
    sha256 "23e07975ceb6f5adcf23afaed1ef50810eaee6c894bce915afa04c82a85e8e7c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_linux_arm64.zip"
    sha256 "c3e65d736e2b7da13c041f49c3f419162006895223ddc492e27b532a9a199998"
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
