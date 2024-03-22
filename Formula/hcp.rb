# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.1.0/hcp_0.1.0_darwin_amd64.zip"
    sha256 "88718e3720a010ffe74fc71136c7609b37cb2e589030c25b72143722fb3310cf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.1.0/hcp_0.1.0_darwin_arm64.zip"
    sha256 "d01abe63c5e7f161df880a7b6530266cc7eb09e59daa786784cd44cf48fc8f80"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.1.0/hcp_0.1.0_linux_amd64.zip"
    sha256 "a7943c993732aacbd8acab6549d29fa12c414a28f934d4ba7473ebfb88289ae3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.1.0/hcp_0.1.0_linux_arm.zip"
    sha256 "c4e3915db21fd5442edba14ca59117ff2b27d39c8c0d04ad1737a810c335eaa7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.1.0/hcp_0.1.0_linux_arm64.zip"
    sha256 "79f0242d26cee445a4db36ad1fd2faae0b1651a82444c920e4a85b6677fd962a"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
