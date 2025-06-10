# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.2/nomad_1.10.2_darwin_amd64.zip"
    sha256 "89c1d8eeb558009456ecafc5ad11e165f411a9337e04304f9a4c13e863968cb5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.2/nomad_1.10.2_darwin_arm64.zip"
    sha256 "0927d2b426907847f49ef59b8fd302b5c376151fc8758a9d0e705e11e30c8ff3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.2/nomad_1.10.2_linux_amd64.zip"
    sha256 "f6aa335261637574c00ce39519ab1fede41493d369b2a0eb17052dba830ff8df"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.2/nomad_1.10.2_linux_arm64.zip"
    sha256 "4ac7adde1d13ed5b3a1ba06f4ce0abd106219c7fb7a85d1d3795afd7ac5d1a41"
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
