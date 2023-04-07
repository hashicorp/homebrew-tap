# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.12.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.2/boundary_0.12.2_darwin_amd64.zip"
    sha256 "14178eb78115198f2b0ef349d55c3e06556024a9c0c6cf364f8ea8eb8602e5da"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.12.2/boundary_0.12.2_darwin_arm64.zip"
    sha256 "83ce0fec80af310aa861be60a738adc64c92e224acc9f45a02293fcecd22c82a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.2/boundary_0.12.2_linux_amd64.zip"
    sha256 "7c3db27111d8622061b1fc667ab4b1bb0d6af04f8a8ae3e0f6dfd58dfb086d41"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.2/boundary_0.12.2_linux_arm.zip"
    sha256 "a7e94e075313097e191ab0d654e7c617b5c5ced52e53abf826c17578701765be"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.2/boundary_0.12.2_linux_arm64.zip"
    sha256 "08a7d655874d828428e8c0a7aeec6b34ea37b8cfc7bdff05062102b013fff58e"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
