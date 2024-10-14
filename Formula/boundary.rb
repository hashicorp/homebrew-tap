# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.17.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.2/boundary_0.17.2_darwin_amd64.zip"
    sha256 "5d36a4491ed294680eb0212fe3f866d77f5ba55b0dfe2ed7a522b712bc5aa181"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.2/boundary_0.17.2_darwin_arm64.zip"
    sha256 "e5d7eb9c3ced8dee166b81a613aecbc60a8ba0c91ceb4abbec5d7034290abca0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.2/boundary_0.17.2_linux_amd64.zip"
    sha256 "55caca1a952017b0362a857ecc4b10ba4c8eac6b394eeb632b4befc31c48b6b1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.2/boundary_0.17.2_linux_arm.zip"
    sha256 "ae222db9d191c7c06a62ab1be0f7de5d86b471a296865cb2192cf9b291c9ca90"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.2/boundary_0.17.2_linux_arm64.zip"
    sha256 "e11b2e816db785b91ecae6247901be83e7d088c9cbbac2b0202e5dab84b41178"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
