# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.18.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.2/boundary_0.18.2_darwin_amd64.zip"
    sha256 "21af2f85e5fea8741b833c7fd9bd1172f6108f4170471dcdc6c45c91402da99c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.2/boundary_0.18.2_darwin_arm64.zip"
    sha256 "e96ee2fd6044c5820f794b97a21a149a4088ae65a7c2ee627f70f0b95efeb773"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.2/boundary_0.18.2_linux_amd64.zip"
    sha256 "2b52371623745eb862780ea965ea773052623028487443353e7d32b4e903a169"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.2/boundary_0.18.2_linux_arm.zip"
    sha256 "1c39500f91f74175bea96ff441ab50e665d4441cf7cf2c8951b2dae7ecb73634"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.2/boundary_0.18.2_linux_arm64.zip"
    sha256 "942f02f1ba0d2dcb0d232b7abdc53c8aa2269d172dd38c5d815dec37f8ef63c9"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
