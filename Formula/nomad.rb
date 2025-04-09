# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.0/nomad_1.10.0_darwin_amd64.zip"
    sha256 "2a7c1f4f85da9d2bed657c9502f4560e57966695f6bcacd3309ada33fcbcb61c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.0/nomad_1.10.0_darwin_arm64.zip"
    sha256 "c71886a7fae7d622c0c579248249a9a1b68bf6da2d652c0446867705a08db24e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.0/nomad_1.10.0_linux_amd64.zip"
    sha256 "d0936673cfa026b87744d60ad21ba85db70fe792b0685bfce95ac06a98d30b9d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.0/nomad_1.10.0_linux_arm64.zip"
    sha256 "b542daaeaf9ddd9f109bbf1a4ec1c05d6b6f2d3645c0ebe21786dec8b447e7d6"
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
