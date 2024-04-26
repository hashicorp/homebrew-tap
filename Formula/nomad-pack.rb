# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.1.1/nomad-pack_0.1.1_darwin_amd64.zip"
    sha256 "c72aac2149aca00ebeee948bbfa6103a7e5191049cc0ab2b884956853d6204c0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.1.1/nomad-pack_0.1.1_darwin_arm64.zip"
    sha256 "3596512e54a074fc6c3a69c79ed43c1e794edfc4e534766ebc1711286780558a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.1.1/nomad-pack_0.1.1_linux_amd64.zip"
    sha256 "0028be2d07845918edff55177fd1db73315f7079dbb9a1dbe70c9cd362221246"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.1.1/nomad-pack_0.1.1_linux_arm.zip"
    sha256 "095549eaf3021545468de2dc1c9bbcc30160b4e8e2979fe7b0b13ec9a16664c3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.1.1/nomad-pack_0.1.1_linux_arm64.zip"
    sha256 "6784cdcc00f075e9d2d03a7d945b41a450a058a499418a2f3a8b573188b516f4"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
