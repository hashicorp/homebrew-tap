# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.14.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.2/boundary_0.14.2_darwin_amd64.zip"
    sha256 "1c2f32101f3c179fd3be36a9181e11cef656287e223657355d89ef8224010063"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.2/boundary_0.14.2_darwin_arm64.zip"
    sha256 "a8f5d5856931e77e897a6b47319807d9298e70b0abb81067c5773a7b558f1441"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.2/boundary_0.14.2_linux_amd64.zip"
    sha256 "f9857707147490630137b8fa62f6086e235ec4d95815c4b8b56724537d8998ef"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.2/boundary_0.14.2_linux_arm.zip"
    sha256 "488214773d474ac3376f25dc46f15955e9ec8ee5b1aa5a6bd2ca2428dea712fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.2/boundary_0.14.2_linux_arm64.zip"
    sha256 "180ae73d2f89bbc60613ad0ce851fab8822c88a8608602ce3dbb58c7bc4bca64"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
