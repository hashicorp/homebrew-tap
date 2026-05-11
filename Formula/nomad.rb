# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.0/nomad_2.0.0_darwin_amd64.zip"
    sha256 "b0852e390f7eaadfb08cf529b21979c6099649a9bcd847179a383f4fafd640a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.0/nomad_2.0.0_darwin_arm64.zip"
    sha256 "0c68df4d93aba239dd3374d08b582329da9c6a9a6c2c6606cdbc295a5660088c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.0/nomad_2.0.0_linux_amd64.zip"
    sha256 "01d175b8467c2d694ab65755da4bb4d6d771bf8e38d411bf80e17a03f9b83419"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.0/nomad_2.0.0_linux_arm64.zip"
    sha256 "cc4818a37e8fea7cb66d54f49a49b3d412c6baaa870e1b8e4c0e9f8a56f126e6"
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
