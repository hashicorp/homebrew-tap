# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.16.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary/0.16.2+ent/boundary_0.16.2+ent_darwin_amd64.zip"
    sha256 "e5933f71c327b9a81637340765f47b37d3ac1883b7cc7b21b21c457dbb9d8347"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary/0.16.2+ent/boundary_0.16.2+ent_darwin_arm64.zip"
    sha256 "0f3f26f185ed58457ade4e4136cb8f8bf0973ef6ecbb62311bcd115be508ed08"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary/0.16.2+ent/boundary_0.16.2+ent_linux_amd64.zip"
    sha256 "2b764bc546bf85b82fd884e57a6d712c0c366bdab4dc6801fdc27c3438c609df"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary/0.16.2+ent/boundary_0.16.2+ent_linux_arm.zip"
    sha256 "5776f45265806386e820b83a58ca3945857d45fce05cae4868fb055cd0c92184"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary/0.16.2+ent/boundary_0.16.2+ent_linux_arm64.zip"
    sha256 "2bc427299fb4c77abe8de9bbcd572605e2aedf67ab4a7e9ea4f495f7c6d0b7c1"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
