# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.16.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.1+ent/boundary_0.16.1+ent_darwin_amd64.zip"
    sha256 "aa4f3d9a58984bb30d210219dd0e0ddc61bb85aae3681434efa04a45c9a93b91"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.16.1+ent/boundary_0.16.1+ent_darwin_arm64.zip"
    sha256 "b8bc590b8e018f50bc48fd1664e484507bb343cc77b6ffc4a271d35d920f3f24"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.1+ent/boundary_0.16.1+ent_linux_amd64.zip"
    sha256 "be78ec19d414b25b0f702630617b19d099eb99e66be51f428b07f095ec88e1fa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.1+ent/boundary_0.16.1+ent_linux_arm.zip"
    sha256 "34e4855cc5ae85ccc10c0a75d860c3b9937d51d00d244c73f5252479c0100c0f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.1+ent/boundary_0.16.1+ent_linux_arm64.zip"
    sha256 "82a16f3be7107e3836ea5d13e730f3f1a481ed043214b3c574ecddb45a747375"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
