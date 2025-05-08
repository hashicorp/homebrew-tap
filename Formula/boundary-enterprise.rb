# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.19.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.2+ent/boundary_0.19.2+ent_darwin_amd64.zip"
    sha256 "95b720f4f367bfb906842c9b8fd2d31d9f7158dfdfd69b46f18a2cc922ffc392"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.2+ent/boundary_0.19.2+ent_darwin_arm64.zip"
    sha256 "6cb4ff1fbbf7777799928f44ea33cc7f71b13257baa0eee4548582e589374790"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.2+ent/boundary_0.19.2+ent_linux_amd64.zip"
    sha256 "9ffc5d65f615dcda0b0703a9fadcaa4d3a74f917ee9ea5448d041bda6356c0dc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.2+ent/boundary_0.19.2+ent_linux_arm.zip"
    sha256 "8924a93dbfb39cc194a69ff313a27f16e0879efca9acd20bc7d7d2f27e3e8221"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.2+ent/boundary_0.19.2+ent_linux_arm64.zip"
    sha256 "537ed4916cfe584ccb0243449866a4f8dccd697ce4eb87ee2f9b5a4b21bae72c"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
