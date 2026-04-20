# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.4/hc-install_0.9.4_darwin_amd64.zip"
    sha256 "79f774732e66c5479a2d77be528705a8529c7cf0098c810b37c6c9aa0d9fc385"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.9.4/hc-install_0.9.4_darwin_arm64.zip"
    sha256 "9f177e37f6eeb9b058f84cdf1ab0744a8554f363ce35b02d6bdb9ae2d370464b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.4/hc-install_0.9.4_linux_amd64.zip"
    sha256 "0d25ed5986b5fa95b545c9e7fc646126f46e58f1ea44f216acf49425e422cdb3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.4/hc-install_0.9.4_linux_arm.zip"
    sha256 "e30d3cb58cc41ba55e7a4488811c10eb4a8e1f8f12aa3b93f14ed73af9f9dee2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.4/hc-install_0.9.4_linux_arm64.zip"
    sha256 "9bdb8dfba8c0f589b1a136694eae084ba2e70fa54189c790e5e4bcd78b21949a"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
