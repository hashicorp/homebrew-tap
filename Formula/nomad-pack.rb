# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.3.0/nomad-pack_0.3.0_darwin_amd64.zip"
    sha256 "16263eb87e15d677eec480aa2a79b0387329d222a100baa25daee4445b183edf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.3.0/nomad-pack_0.3.0_darwin_arm64.zip"
    sha256 "a928fabcc61fcbc9ff226e063af23a21b6c4ac57a9608ac9656408f9c37c7061"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.3.0/nomad-pack_0.3.0_linux_amd64.zip"
    sha256 "0a4d83ce937e93c83248b9fbe7e80750767d26e57af07f59f24583426d531ea6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.3.0/nomad-pack_0.3.0_linux_arm64.zip"
    sha256 "018ed23c485abb7d8354d471051a6aab3cb604195f1d071e556f6417eccc5894"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
