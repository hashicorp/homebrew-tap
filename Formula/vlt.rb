# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.1.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.4/vlt_0.1.4_darwin_amd64.zip"
    sha256 "8baa9e916ba718296e27409db9ad7ad92d3c5c44ce8b6558cdbe9fe45544e74c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.1.4/vlt_0.1.4_darwin_arm64.zip"
    sha256 "24d13e2a27aa05ce04c132b13ced625cf0f5ee00efc98069a9d33a4f82407679"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.4/vlt_0.1.4_linux_amd64.zip"
    sha256 "d0e7defc8092ff6a194a4a212f3bd094a77cb8f6ad4e942ddf5943ab469574fc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.4/vlt_0.1.4_linux_arm.zip"
    sha256 "a1539550a986675859da53f83ccc3c5c3d91e61bfa149af70f4852f50916b542"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.4/vlt_0.1.4_linux_arm64.zip"
    sha256 "28cb89cdfd5a074f00b0cc9a05f40e3b54c8ac756c2b77cd51b23f28bc7c7144"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
