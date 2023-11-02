# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.1.0/nomad-pack_0.1.0_darwin_amd64.zip"
    sha256 "64c836406dc92859fb2a7ac048f1255e36974ab4225c2b46ffb47b9a0271d637"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.1.0/nomad-pack_0.1.0_darwin_arm64.zip"
    sha256 "b414eec23213c312996c3caa0ce0584579eaa63869e6ff4a50a0bcf171c0c4d2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.1.0/nomad-pack_0.1.0_linux_amd64.zip"
    sha256 "20604ae26caffc506a5f6ad993bc8925f6022d1875c678e91a0897e1a2411288"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.1.0/nomad-pack_0.1.0_linux_arm.zip"
    sha256 "ce8dd02aa1984767225b45db79fc7152cf0da077774354c5dfabaeff7c2e3855"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.1.0/nomad-pack_0.1.0_linux_arm64.zip"
    sha256 "30afcad9d542eb6938d1e8940346958df871fa3353208f7cc13b67e033b12d99"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
