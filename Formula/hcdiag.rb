# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Diagnostic tool for HashiCorp products"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.13"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.13/hcdiag_0.5.13_darwin_amd64.zip"
    sha256 "28f58db0239b4d4ff2259f2591b9e461410522e0a5963ab9b747ef8023f41495"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.13/hcdiag_0.5.13_darwin_arm64.zip"
    sha256 "81e18ed8937e5e5ec8b5d6e02d30089ac1ef7498ea8854482220aa7f50f54b4f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.13/hcdiag_0.5.13_linux_amd64.zip"
    sha256 "856c86e3f208775ea8982aa76754fd38f192762541225aa3fc127fd19743bb8a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.13/hcdiag_0.5.13_linux_arm.zip"
    sha256 "848ddc1a6bd6882f96042038a9822068a82256fc2111ffab43f329de4a5aad26"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.13/hcdiag_0.5.13_linux_arm64.zip"
    sha256 "12551b7a8b86c93053831f7cadaff921273cca60dc53915220a3bad35fcf118e"
  end

  def install
    bin.install "hcdiag"
  end

  test do
    system bin/"hcdiag", "--version"
  end
end
