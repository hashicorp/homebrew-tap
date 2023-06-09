# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.0/vlt_0.2.0_darwin_amd64.zip"
    sha256 "094d1749bab5b25f6f26668bdf7389e0103bb114f61a819ad746c91e31228d36"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.2.0/vlt_0.2.0_darwin_arm64.zip"
    sha256 "86c4bac5529abd738f64b825e1b8061eff0b04baa1700b210b262f9fe4fc7f0e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.0/vlt_0.2.0_linux_amd64.zip"
    sha256 "f280be1d04f372250917ef71d78c68c2397f87fb2b9cfe34971da02f101aacc8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.0/vlt_0.2.0_linux_arm.zip"
    sha256 "835d5d7d84ae7197cb7280596728f8e93bf0882f30d40d1e0676b99829aee4c1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.0/vlt_0.2.0_linux_arm64.zip"
    sha256 "b9f66c836cb788ad26c92807334b958e01d26074d7785476cb391c611f5710e8"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
