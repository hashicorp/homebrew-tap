# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.3/hc-install_0.9.3_darwin_amd64.zip"
    sha256 "4c10e23ec131fa475080d8d328c839c04dda6d615f4ef4362c44de6cee7d9a60"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.9.3/hc-install_0.9.3_darwin_arm64.zip"
    sha256 "4e9084b36ef2940d69f85e8060d2e372b59b3063acc6b44c144e9129e2aca427"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.3/hc-install_0.9.3_linux_amd64.zip"
    sha256 "9582a216c20b21e9fe199706f2b7dcacdb3425b2cc3f1ae9759f0f880128b37f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.3/hc-install_0.9.3_linux_arm.zip"
    sha256 "45332a78b25d7b76335da98679803f27f1740b0006fa3da05f39ed79648b4fa4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.3/hc-install_0.9.3_linux_arm64.zip"
    sha256 "3660e8ba69793450c73b47676153fc8c241abe86f97796ce8f6f26a27cb07f54"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
