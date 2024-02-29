# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.15.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.1+ent/boundary_0.15.1+ent_darwin_amd64.zip"
    sha256 "a4852cfb3cf56e474926d9bea1e0ea64f4c3db647050dfca1489275faa4be138"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.1+ent/boundary_0.15.1+ent_darwin_arm64.zip"
    sha256 "7c295577dd773b2a8fb614ddb574787393aa93f43eaaa02e5a5fbc5e97bb6320"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.1+ent/boundary_0.15.1+ent_linux_amd64.zip"
    sha256 "adfe0321bca127e4c93db12a2b0c4931ab1e303224da40bb5ffc598784bd0d08"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.1+ent/boundary_0.15.1+ent_linux_arm.zip"
    sha256 "8b0f785c6ffd46703bab1ca6eb5775cfc1680d2c0353a72ef5db7117aeca1576"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.1+ent/boundary_0.15.1+ent_linux_arm64.zip"
    sha256 "fa2c23d0d2d1fb76b0be22aef52f2f630f5ea1d94282f6ad2aca64a66977fd55"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
