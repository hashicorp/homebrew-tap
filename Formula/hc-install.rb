# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.8.0/hc-install_0.8.0_darwin_amd64.zip"
    sha256 "7da56fd972ab76793a8d2fd43c4f4f4f88e379d7ea852580f56e197d421e9a56"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.8.0/hc-install_0.8.0_darwin_arm64.zip"
    sha256 "f8c70b60355b5ef52b5508d5166835b817f037b3c2cc889df268640e00d27d4b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.8.0/hc-install_0.8.0_linux_amd64.zip"
    sha256 "8d5c8048c99907a4cca5fd528388aae1bbf3c0051d691d94d0e7afc1d6fe845e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.8.0/hc-install_0.8.0_linux_arm.zip"
    sha256 "4e1d759873d26eb100470d236aaf98efabf45fc8ed8f4a10a5d95d6925971d48"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.8.0/hc-install_0.8.0_linux_arm64.zip"
    sha256 "c1dcc3d425e4ce4ce18338f1b75021cc9de1c1588cda37aad7bcb3fe2a1cc031"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
