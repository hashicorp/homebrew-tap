# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.1/hc-install_0.9.1_darwin_amd64.zip"
    sha256 "620d29d6cc7650ad03347dd4402c2cfaf52969f7b3b6e9453b83e1b43b29370d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.9.1/hc-install_0.9.1_darwin_arm64.zip"
    sha256 "29f1a0aea689d547fb04a36d37257d72ba134f07f55e4e86fa5c32566002063b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.1/hc-install_0.9.1_linux_amd64.zip"
    sha256 "45055e708f24dbbf13ba83cb14df73822db98850ec6aee7b1da001b8be5d4f23"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.1/hc-install_0.9.1_linux_arm.zip"
    sha256 "87bc8996fb6ad90b9dc420170cc5f684c296a5f3627cdf3449d470ac089c8e10"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.1/hc-install_0.9.1_linux_arm64.zip"
    sha256 "94418bbb8677c551174e7984dc50c0ac6c6e1a58fa7cd013851538be8c38065e"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
