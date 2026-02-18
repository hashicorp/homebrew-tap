# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.11"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.11/hcdiag_0.5.11_darwin_amd64.zip"
    sha256 "98b394175b5490accc777dc2d117bc3c48e369b6af57f5e10aa1a7b563d18bba"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.11/hcdiag_0.5.11_darwin_arm64.zip"
    sha256 "24fa64731e3407d9fa034709e2a85ab464c73e54401d99b59ec1388b695c3149"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.11/hcdiag_0.5.11_linux_amd64.zip"
    sha256 "0093c601b2a1bd0b0a0ecb0806f8de34c104bafdcd9cc2239af90e999d572d8a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.11/hcdiag_0.5.11_linux_arm.zip"
    sha256 "dc910c2c8ef8afc71ea916cd11410e4b27bf3bd26f9f454643f427ac3e05b971"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.11/hcdiag_0.5.11_linux_arm64.zip"
    sha256 "cedcfe262d52d31a91f28f3804126ae3e826ef29a455d6620d7f735ebd60e056"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
