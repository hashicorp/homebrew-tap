# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.8.0/hcp_0.8.0_darwin_amd64.zip"
    sha256 "57f69f718b0c883635b50303f32acc618639b73cb0f5d320e8289585e38ba92f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.8.0/hcp_0.8.0_darwin_arm64.zip"
    sha256 "c92caa9ef7a8de9766ce68baa47ef1c38e674491ab9fa64cf84128d2e5cb8663"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.8.0/hcp_0.8.0_linux_amd64.zip"
    sha256 "5b00869908c25ff68291b51c5d3538655eb31b927c71db37baa7b89441e99f78"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.8.0/hcp_0.8.0_linux_arm.zip"
    sha256 "082f2e7721acf5eee60d557fdd489cf766a91167e2366b52a213c602160d9b38"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.8.0/hcp_0.8.0_linux_arm64.zip"
    sha256 "b98b0a535263b0947aee13e8abdc5d1f402b316d5535201c6903abe96335fb09"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
