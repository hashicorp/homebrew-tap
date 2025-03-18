# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.9.0/hcp_0.9.0_darwin_amd64.zip"
    sha256 "bda9e68a1a416b39b48371008be0bca5e4a9fa096c243b4de83e17bb2f474b75"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.9.0/hcp_0.9.0_darwin_arm64.zip"
    sha256 "34ef3ad4f38ad47a7960e811e087fe85611740357f9344f6c56332c353a957c7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.9.0/hcp_0.9.0_linux_amd64.zip"
    sha256 "713f3996204a11b2b1970d4517a84405fbc9d5821ee1008f8dc0735a82ba2f7c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.9.0/hcp_0.9.0_linux_arm.zip"
    sha256 "ab4b30b9e8a6bc9e4a2611f97825c5fc97d1d9a5e8450d37cc7fc67c3454db41"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.9.0/hcp_0.9.0_linux_arm64.zip"
    sha256 "f7a0d304e5506f3891afda5dcefd53de697b2a064c6dc93dd644af55d7fe22bf"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
