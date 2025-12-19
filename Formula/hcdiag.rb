# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.10"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.10/hcdiag_0.5.10_darwin_amd64.zip"
    sha256 "8e7b782fc56909321b53cb18decc8dba3f37e28e211c38cef70605aeb2fa12e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.10/hcdiag_0.5.10_darwin_arm64.zip"
    sha256 "831548a4d1cbbcd28639747e3baa1375074d6edd32424da359d8a72363eb8ff2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.10/hcdiag_0.5.10_linux_amd64.zip"
    sha256 "77b3db03e61d35ed20bc3ad273bab5f3cbac4e8447e658b23e0fa10b539393f1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.10/hcdiag_0.5.10_linux_arm.zip"
    sha256 "a80468c3e2f9fbe6a0dc6e68090552e5e2d74c6ce111efbda2d91921c08817ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.10/hcdiag_0.5.10_linux_arm64.zip"
    sha256 "9dd7bcdde5e04ac4ecfc2482a1740b07859be3c28dc450c8c66f72dc83738668"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
