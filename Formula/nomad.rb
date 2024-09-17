# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.8.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.4/nomad_1.8.4_darwin_amd64.zip"
    sha256 "6e7d01e5d7e09ff615701dfa61f5c6125c884577d9ca6bfdb5e36ca2307144f0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.4/nomad_1.8.4_darwin_arm64.zip"
    sha256 "3e096c7ac8b6bc200e0d3f360f89a2facbf13778216823574153c1ad1ed8021f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.4/nomad_1.8.4_linux_amd64.zip"
    sha256 "681832b4ffaff0626119420569f117fb7ad1e323d6c929ef3c0bccb432165c6b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.4/nomad_1.8.4_linux_arm64.zip"
    sha256 "54c92041133073cd4b642c2530990fdcd3ccca1003507d0c636448385d867147"
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
