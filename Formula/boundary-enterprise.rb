# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.0.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.0+ent/boundary_1.0.0+ent_darwin_amd64.zip"
    sha256 "6638a7f72135fd07639ef6beb184db12d4c40f090197c692a1260f9d0d6c8d71"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.0.0+ent/boundary_1.0.0+ent_darwin_arm64.zip"
    sha256 "15c3e97c78571a90f63c4497f547ba1273b260a32b56f37af7fde35c8595dee2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.0+ent/boundary_1.0.0+ent_linux_amd64.zip"
    sha256 "158950560608d094e4ed51176ae7decca2ea88af8593cc60e7462bfd7ff81af2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.0+ent/boundary_1.0.0+ent_linux_arm.zip"
    sha256 "f25140a242d0ffb90d2ae0d83ecd498a42707ef4fdee0924f949f11855717665"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.0+ent/boundary_1.0.0+ent_linux_arm64.zip"
    sha256 "efad62afab7eb91ee105210dfa0a912d16c159a20f06cf321182a96061761191"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
