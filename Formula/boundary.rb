# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.18.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.1/boundary_0.18.1_darwin_amd64.zip"
    sha256 "d381c5f02824049905dbbab02e34bdb3c73ae4ce7a0ccfa7c962d7e2c5d99e88"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.1/boundary_0.18.1_darwin_arm64.zip"
    sha256 "b20abbec1ed3deb8905d4053c842f81d8be651077fd111ceb4b20810ed0896e6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.1/boundary_0.18.1_linux_amd64.zip"
    sha256 "041420f39f08bee06925d36ed7d2ded252a9ba4a1a1dc7b0dd418f855785a1e4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.1/boundary_0.18.1_linux_arm.zip"
    sha256 "d9dccef305703c9808ad45e93ee1204d54067cf832a38d97ead45e91c01f65b7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.1/boundary_0.18.1_linux_arm64.zip"
    sha256 "dc271a5ce0bea964ae992aac6c43ed1e9e77a44439fd2de5ac0c02a19ad03e31"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
