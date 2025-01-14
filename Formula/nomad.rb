# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_darwin_amd64.zip"
    sha256 "2e8de144449746492038563004b9e0f388e0c227556ed1787dc58acbb0d8ac5c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_darwin_arm64.zip"
    sha256 "b3bc921fbd56cf5f274ef209eb2d79a9abd1603409ef72a915119a6d88185d92"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_linux_amd64.zip"
    sha256 "290ab1f7fdab2b7197a05eaea4a962d8f2966f7736c957c4c2a8f0196d2bcdb2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_linux_arm64.zip"
    sha256 "13205cb3713cafc8935ccf57119ff66a6955e4a60961cd2c1252679d7ee63d9c"
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
