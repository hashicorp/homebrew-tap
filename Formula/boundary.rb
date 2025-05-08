# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.19.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.2/boundary_0.19.2_darwin_amd64.zip"
    sha256 "5bf3413d0b1b4a8d60a58717c9fa92d7b2fc430d5e0fad54325d2fc59e6f944d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.2/boundary_0.19.2_darwin_arm64.zip"
    sha256 "dac49bb1e727af4ec5f1ad7c20f0a2769158b5faeed83a5b6f3cd6b2aeab701b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.2/boundary_0.19.2_linux_amd64.zip"
    sha256 "e3a628fca49adc9d5b6e8946c5d3835fa09878be60210de8e9946339b0f4820f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.2/boundary_0.19.2_linux_arm.zip"
    sha256 "3caaf8b44d223594d2e9c790be00c0830fd923d10fa65c818d3dbe895e703118"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.2/boundary_0.19.2_linux_arm64.zip"
    sha256 "03db0cfe813df0c2d08ec23c8c2b03da5a9ae31bd38e695bf45fa6564d57add3"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
