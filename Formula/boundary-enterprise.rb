# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.18.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.2+ent/boundary_0.18.2+ent_darwin_amd64.zip"
    sha256 "fd9c0b26589ba2ed4e29a58f1b3ee9f4710fdb2b0e3b795224ab6dc67311be88"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.2+ent/boundary_0.18.2+ent_darwin_arm64.zip"
    sha256 "786463c60c55ad441f0a7491315952bf2272a36e3dcffe48dccdb52c2add8d02"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.2+ent/boundary_0.18.2+ent_linux_amd64.zip"
    sha256 "acf099018e850afbe3c29868dbee96c979d2828c048c7208f29b14e922f475fa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.2+ent/boundary_0.18.2+ent_linux_arm.zip"
    sha256 "aff5ab7b2e4ea5c3975a076c3ce0e59944737212d180b74eb293917189396af3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.2+ent/boundary_0.18.2+ent_linux_arm64.zip"
    sha256 "363ff920cdfe81d96fa33518e49a4f7d412c1518852246e236d2a4fa0dabf5aa"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
