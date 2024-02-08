# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.4/nomad_1.7.4_darwin_amd64.zip"
    sha256 "794190dd8da9c15780b6b317568a96ab98a0072dab11449d9542f1b64bd217a0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.4/nomad_1.7.4_darwin_arm64.zip"
    sha256 "ff5156c0ab459e2654682a680b39786d4be5c646459c12b90d7003d9a9293b91"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.4/nomad_1.7.4_linux_amd64.zip"
    sha256 "de8acde5a7564cb8fa3c50c6ef94876b07426c1996898eb1ae8e9566ff9143aa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.4/nomad_1.7.4_linux_arm.zip"
    sha256 "d2f569b092d0fb9b385b330dd30aec6dd4378613ca3ae8c7288de0319fc87349"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.4/nomad_1.7.4_linux_arm64.zip"
    sha256 "12d3835811ca7a0b82dcd9238344be5722700a3d7f6a83d7db72a07988ce88be"
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
