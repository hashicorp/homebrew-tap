# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.5/hcdiag_0.5.5_darwin_amd64.zip"
    sha256 "4c96eb7f94cdf110b7eb65648d74007c751f6f09de4ed87801a78a3f281d4ba0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.5/hcdiag_0.5.5_darwin_arm64.zip"
    sha256 "098681c1b694cd1f83dfc2198f923292afe06aa99a7c5aebc00cf7fac4714f87"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.5/hcdiag_0.5.5_linux_amd64.zip"
    sha256 "82ebefa3f15ea8d3acaa0495a05cdb82d84db1a74672f599b8077bc9604a80ea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.5/hcdiag_0.5.5_linux_arm.zip"
    sha256 "4d607cc4c0a28b79dd2b085e214bd850fe04d740c8dc7bf6a0076422d8b9c2cd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.5/hcdiag_0.5.5_linux_arm64.zip"
    sha256 "9c0b21ecd10cf022d4ae66933b3343fa7b6a4fd0768b1fc406e7f8351034fc3e"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
