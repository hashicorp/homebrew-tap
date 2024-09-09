# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.3/nomad_1.8.3_darwin_amd64.zip"
    sha256 "7177028550fabd0f8856079d3153b3ae7180e5d9fc23c0c76e6c4ef5e4873ffa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.3/nomad_1.8.3_darwin_arm64.zip"
    sha256 "0ff2cb21c92aeb9742303140a17fb90437ff9a21d6752f0278f2ec54885117af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.3/nomad_1.8.3_linux_amd64.zip"
    sha256 "a0c92d427fe8839bf3aab9c62b2d12190483f953a3483c08891e53f65f676797"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.3/nomad_1.8.3_linux_arm64.zip"
    sha256 "3c316dca8c1110ceceb3f7582eeed238719f5db7ce208ee7c252e7cae58d9365"
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
