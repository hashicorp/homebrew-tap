# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad-pack/0.1.2/nomad-pack_0.1.2_darwin_amd64.zip"
    sha256 "98ce44bf0a35a3d0148c766bdfd3fa330f9da00bcb2269b065ba55ed7d20eed8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad-pack/0.1.2/nomad-pack_0.1.2_darwin_arm64.zip"
    sha256 "12fb5cce35cc532513bb392a35c9c3af7a7381f232077c49b12510ba802dc82b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad-pack/0.1.2/nomad-pack_0.1.2_linux_amd64.zip"
    sha256 "7b89d9652e8622a99270fbbbc7fb457383d9f624faceaa41d2292bacd37a51ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad-pack/0.1.2/nomad-pack_0.1.2_linux_arm64.zip"
    sha256 "bb1410a1efc80299792fd929e49d915e4db3a4a560a5de1c45e4628ff1f1e5fa"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
