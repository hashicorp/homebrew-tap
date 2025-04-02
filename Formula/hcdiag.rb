# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.7/hcdiag_0.5.7_darwin_amd64.zip"
    sha256 "05023a09c793689ac1e942b21b83ef75d0de5c4df824bcf536b6f6d4855eaed1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.7/hcdiag_0.5.7_darwin_arm64.zip"
    sha256 "de7973538fb73d6393887f65210de95d219009b1091e82e85aebbfaa594be0bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.7/hcdiag_0.5.7_linux_amd64.zip"
    sha256 "cacdb7de0b60ab7d7b2de01bacdce82316303aec3d54707ed363d6024e795687"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.7/hcdiag_0.5.7_linux_arm.zip"
    sha256 "8b51b0ce4eb42bf94cb4bb4fe49bae9574e430ab275d0576dd26d6a4c5ddf81c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.7/hcdiag_0.5.7_linux_arm64.zip"
    sha256 "47ba3c81411bf135fa0337b38ccca5a4586f02e6cb9de7113d7beae7a3ab21e9"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
