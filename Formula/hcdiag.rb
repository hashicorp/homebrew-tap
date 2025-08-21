# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.9/hcdiag_0.5.9_darwin_amd64.zip"
    sha256 "66f77ccb4839c8a568e1883f4c9ef9a78e31f71c9e9fcb6fdacbc2ba48060128"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.9/hcdiag_0.5.9_darwin_arm64.zip"
    sha256 "1c573b31994f4169473ca80ee981a057e3eaf862ad5d4668d7ca3f44ccfa8a1f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.9/hcdiag_0.5.9_linux_amd64.zip"
    sha256 "8ecb29f7b3c14e29e732811b5f42e99d191fde1a63d4f217e7995a56399825a7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.9/hcdiag_0.5.9_linux_arm.zip"
    sha256 "f675820dc604817e55b19117fff274868c8b8243c0b10426a3bfa26c069eb240"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.9/hcdiag_0.5.9_linux_arm64.zip"
    sha256 "434779af5461261baf87fe2a03c58f585132e0a2425572c32b71cc4e5747a772"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
