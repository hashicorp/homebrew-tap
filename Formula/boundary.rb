# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.0/boundary_0.21.0_darwin_amd64.zip"
    sha256 "c3f68707ed6caf735c8b0cb54e973a0fbaaeb658e25626935cab8e97ae08fc03"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.0/boundary_0.21.0_darwin_arm64.zip"
    sha256 "59dccd76065da4e2a9c9fd186cb77b91b754b5c670b1e8c8eb2af94c2dd5cace"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.0/boundary_0.21.0_linux_amd64.zip"
    sha256 "434d569818622b77b2849f20fe64992240df7d3cffba97e65d6913560a0c960a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.0/boundary_0.21.0_linux_arm.zip"
    sha256 "7f37c2a679e7a3acdd15e81e1ad860255ef35474f3a8c7974bddbc972afaa90b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.0/boundary_0.21.0_linux_arm64.zip"
    sha256 "1327f86818e42d81edece837c3054164f76815afb0e8df24e14f379a1e08f89a"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
