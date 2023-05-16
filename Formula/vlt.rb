# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt"
  homepage "https://github.com/hashicorp/vlt"
  version "0.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.3/vlt_0.1.3_darwin_amd64.zip"
    sha256 "e5185150d19f43fc42e9908a22663a41b6f5e0945270dc321d38fc1d80fb392f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.1.3/vlt_0.1.3_darwin_arm64.zip"
    sha256 "85196b53968323062112dbdee6790687acab97e56e6d13fb34b282f1a6920852"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.1.3/vlt_0.1.3_linux_amd64.zip"
    sha256 "9cb7e967a81b7348b6bfe08bb6f23dd4ba2af3fd72284ec75ad2d294dfc317f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.1.3/vlt_0.1.3_linux_arm64.zip"
    sha256 "4de6ebeb6e34f6b84c49c1091c85b03d254bdccfcc986b72a91df5eb321c8ba1"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
