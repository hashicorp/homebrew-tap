# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.5/nomad_1.7.5_darwin_amd64.zip"
    sha256 "b7999b030914fbd3f9a10b9c853e742fb3cec8ead42241e60140728147a582be"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.5/nomad_1.7.5_darwin_arm64.zip"
    sha256 "145e8096164e361fa4d797c60b8a6622e243f333779484300573fc5cd90f6835"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.5/nomad_1.7.5_linux_amd64.zip"
    sha256 "da04e002e5b12fba3713de89f5d89d1374184009d32a68b16c8791c3bed6ceb0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.5/nomad_1.7.5_linux_arm.zip"
    sha256 "20cb2f48470ae80f01863c6639612d8250158bb06d41e8535f68b64131eafe0d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.5/nomad_1.7.5_linux_arm64.zip"
    sha256 "6bbbad433f172c9aff329521fd0134efc05f1d339993d564824c1bad363ab898"
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
