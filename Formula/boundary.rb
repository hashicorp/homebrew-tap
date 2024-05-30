# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.16.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.1/boundary_0.16.1_darwin_amd64.zip"
    sha256 "63faa9204a83469508943c4f832410c5651893067f7281574f1d0356e621d43c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.16.1/boundary_0.16.1_darwin_arm64.zip"
    sha256 "09fd9c6c96682c9cd29be583cba82297806b2ab6805bb838c51570393f137bba"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.1/boundary_0.16.1_linux_amd64.zip"
    sha256 "a9e204896f4cbeef46c570d34e68ccdfb858dda4539d7c9e18120fccdbb6d205"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.1/boundary_0.16.1_linux_arm.zip"
    sha256 "d7df0d7ada5801c1d23292a34c10df813ced1ae9094b79116c18a1ee16320849"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.1/boundary_0.16.1_linux_arm64.zip"
    sha256 "21279813e849f765f9ef1b179e847a0d0fdd2c7fe8c08fed205e6920e78444b5"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
