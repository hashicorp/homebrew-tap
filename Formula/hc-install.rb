# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.1/hc-install_0.6.1_darwin_amd64.zip"
    sha256 "9329cffa3050cb47d7f14de6999e9581efcf5376734aae44a253b129b0786da0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.6.1/hc-install_0.6.1_darwin_arm64.zip"
    sha256 "daa64ee79b4b499bcc400b8480b255603d8e0b505d61500533f33345a808aa5d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.6.1/hc-install_0.6.1_linux_amd64.zip"
    sha256 "ab51eff71e9503054d0a1246b116dc46001841f06e56fe9d8e0c197dd00dd565"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.1/hc-install_0.6.1_linux_arm.zip"
    sha256 "1943f4173981c71acae499cca6e1ddcda2f81b1e3dcff3bd885de4b2b3e93f6f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.6.1/hc-install_0.6.1_linux_arm64.zip"
    sha256 "0eecb645fe2b8f90eb3736608aa40ebff5da6bc251bd153d653829707bd68d97"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
