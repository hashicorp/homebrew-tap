# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.8.1/hc-install_0.8.1_darwin_amd64.zip"
    sha256 "44987996083dc56f02789ddb1121e0adc9988e7c40c2fb5473c0403968759e9b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.8.1/hc-install_0.8.1_darwin_arm64.zip"
    sha256 "ba98b0716d6ae4e3338d5c1b19a3f6f33e4bfde4bedb13b290730d97177134c0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.8.1/hc-install_0.8.1_linux_amd64.zip"
    sha256 "d9e52d5d2543ba0d9d8f597f331a8be15f29547ad10b26b5c1e1305fa74e19a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.8.1/hc-install_0.8.1_linux_arm.zip"
    sha256 "efe7bed83e90e6cba950bf2fb00db7b4ed7c474fea8639e8dc916ebc71ef5a5c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.8.1/hc-install_0.8.1_linux_arm64.zip"
    sha256 "4dbef840f75aba9ff2e03d251dfcaefbf1647c403dce44deadc71ad60bd16b8f"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
