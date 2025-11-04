# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.20.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.1/boundary_0.20.1_darwin_amd64.zip"
    sha256 "19be38904822761e6e6b67abd008260490ddc301f4602955bd9822a5009c1eb8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.20.1/boundary_0.20.1_darwin_arm64.zip"
    sha256 "694226a8e860cb0f1165ebd1550278db777ad049c2ac98d220581298b0677a8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.1/boundary_0.20.1_linux_amd64.zip"
    sha256 "00e7145c483d38b21d48ebb13d63c73aaed9771baa13e9d8a4d34da24aea4240"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.1/boundary_0.20.1_linux_arm.zip"
    sha256 "519feb766c535031fb6dde7caeac8c8cd096c31b0983bfc39beb68cebf2dd0a1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.1/boundary_0.20.1_linux_arm64.zip"
    sha256 "0e96e199158521fc0192547846aa72db3c891de5719e9fcb808b5aa4485fcbfb"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
