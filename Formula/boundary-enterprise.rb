# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.14.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.1+ent/boundary_0.14.1+ent_darwin_amd64.zip"
    sha256 "c63033a77dee1d550f9174bb1d57ef79b569f3862a5d0b8e5a10dd870b991ea7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.1+ent/boundary_0.14.1+ent_darwin_arm64.zip"
    sha256 "50723afa75f462c8f594504b7c223ed7ecb99b091ab6b6e523aa19614752dfe9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.1+ent/boundary_0.14.1+ent_linux_amd64.zip"
    sha256 "5add5627e03309eb873866bb2e7344b13939d65c4bdb61c6f6a9edd625c4fb22"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.1+ent/boundary_0.14.1+ent_linux_arm.zip"
    sha256 "0dc4004d9397164aa7d78a10a7e63a7b2118ef48af64de4d3a1f86b365661eb9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.1+ent/boundary_0.14.1+ent_linux_arm64.zip"
    sha256 "32358aa7c37bd220ab47fc1a16b9e850dcea09def96eeb3c4c213e03f3cbf644"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
