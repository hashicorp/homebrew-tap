# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.21.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.0+ent/boundary_0.21.0+ent_darwin_amd64.zip"
    sha256 "bc9b08e20e955111603fe5bde363d8e9664aa26d02789436f03821d48f8ef6e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.0+ent/boundary_0.21.0+ent_darwin_arm64.zip"
    sha256 "163f8a2ba2447747b0cc2109b5904dde8d5e9e44899292c3bd87f8a83c114185"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.0+ent/boundary_0.21.0+ent_linux_amd64.zip"
    sha256 "d363018ae2d832ce6793c06ede392ddf46f32088b29ea2ee7000f9f362eed5c5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.0+ent/boundary_0.21.0+ent_linux_arm.zip"
    sha256 "3ef2f42d92eb94ed42529a22f55f2f6b590c3d538f8a90a2f8a2c9b62962cef5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.0+ent/boundary_0.21.0+ent_linux_arm64.zip"
    sha256 "6ceba2a4a518f1e5782c61eccbeff9532ed9b446698c1d919b6dea55a8c539c8"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
