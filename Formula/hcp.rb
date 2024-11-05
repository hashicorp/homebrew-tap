# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.7.0/hcp_0.7.0_darwin_amd64.zip"
    sha256 "0d6744fcc1f7159be6d76148541a008898ec30825ff833d8bf50989fd1b90985"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.7.0/hcp_0.7.0_darwin_arm64.zip"
    sha256 "7a3fea2dccbea8686e1858d7df154407441624ea7e1df1297227e543724b6639"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.7.0/hcp_0.7.0_linux_amd64.zip"
    sha256 "90d3dbdbbb22fb32fc75c721cb076e0a2a115f510684dc49050eb040344f05a2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.7.0/hcp_0.7.0_linux_arm.zip"
    sha256 "a43d2a3fbc5e1ce7521afde7ce8f6b8c32e57ed291619488d5cbd1e79d425291"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.7.0/hcp_0.7.0_linux_arm64.zip"
    sha256 "b44d1a5fd8c1a0a68782a9a02b4fa43d62d497a8381df3b647762b5c5c4ea7d8"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
