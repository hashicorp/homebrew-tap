# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.2.0/nomad-pack_0.2.0_darwin_amd64.zip"
    sha256 "e0a1a7db24783b5b9faaa13b49050eb9b643be02357c5d7dd3c0de5ad4d9e6d9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.2.0/nomad-pack_0.2.0_darwin_arm64.zip"
    sha256 "68d33c69c616377267c77a2ccb63e3a4365406764f495ae21d19a890274e49a0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.2.0/nomad-pack_0.2.0_linux_amd64.zip"
    sha256 "32533e635b78101056f411366e26aca7778ea80f8556002f825784e1d75a4437"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.2.0/nomad-pack_0.2.0_linux_arm64.zip"
    sha256 "63c918f90d790d70b87f7c550366ad03238aab8a3eb0edb70ecad009659e453c"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
