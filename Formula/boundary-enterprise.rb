# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.13.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.1+ent/boundary_0.13.1+ent_darwin_amd64.zip"
    sha256 "8c134b7be813343442f103c08f788a1aeb698ed6802dafec1a5a82bb578485bd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.13.1+ent/boundary_0.13.1+ent_darwin_arm64.zip"
    sha256 "6650cf368fa9bb7f87fefaeedf6f5da0c660763ac89048e2539cec528acf53de"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.1+ent/boundary_0.13.1+ent_linux_amd64.zip"
    sha256 "de4af6004766ff568a8ab6700c5ec5553f44e6861a1abedb1182338f825c2c76"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.1+ent/boundary_0.13.1+ent_linux_arm.zip"
    sha256 "20be0a49e5e9d82b4d8aeb77ee08a0b32d4083867dfc6905d19abef92c5bd2dd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.1+ent/boundary_0.13.1+ent_linux_arm64.zip"
    sha256 "c933bcde990aee4eb0691737697f62729d71cda818defe37e9cc58b18d24dc90"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
