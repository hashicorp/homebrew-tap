# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.0/nomad-pack_0.4.0_darwin_amd64.zip"
    sha256 "87057908352ab592cfaf9b857823b1c0964510a40ec3a58e71ec417e39d3be37"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.4.0/nomad-pack_0.4.0_darwin_arm64.zip"
    sha256 "bd2d77362cd08f32b0fdf60facd5459a01424d825f6770db1716d6c9912cf123"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.0/nomad-pack_0.4.0_linux_amd64.zip"
    sha256 "c4597c3bfa31f3f3296584dc7fc63f92c8ad35b92b85f9df75ec4c405ac082c0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.4.0/nomad-pack_0.4.0_linux_arm64.zip"
    sha256 "579eb0e34406dcb4227cb375ebcdf85e0c06bd8724468ee03ff7175a50cdbe59"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
