# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/1.0.0/vlt_1.0.0_darwin_amd64.zip"
    sha256 "47b0c99cc88fd5e8e0de60f283f86d0f5d9ba46dd10bb4a6c3c6e29eefdfe1db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/1.0.0/vlt_1.0.0_darwin_arm64.zip"
    sha256 "c6e090f1d93c9977b039281d247aa66d91737ea0767547b20776635aa9eeaa69"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/1.0.0/vlt_1.0.0_linux_amd64.zip"
    sha256 "1a7ab59cb16446f39412d85cab24ec729986ca6ac0f7a49d0ae210e279024bf2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/1.0.0/vlt_1.0.0_linux_arm.zip"
    sha256 "654f987b50f55654daf05d0f644a85ab625bf66282b7b9e9aa883e88b56ef9fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/1.0.0/vlt_1.0.0_linux_arm64.zip"
    sha256 "e20529046b9a24fac9bc5d271c13db745d181c55ceed285f8d36af61a562143e"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
