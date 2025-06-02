# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.10.0/hcp_0.10.0_darwin_amd64.zip"
    sha256 "1440bebd4859920fdeb7118a7da8a84e7680328e24ef5b29f85115b4bd71b162"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.10.0/hcp_0.10.0_darwin_arm64.zip"
    sha256 "e054b7499d0c9da432d9bd84782e30e11ca2538f1097ea327710b225225d4eec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.10.0/hcp_0.10.0_linux_amd64.zip"
    sha256 "d9f0af27a87c4bf43ab15139985c99a4c70b0e3e37b64d1a97e6978550fb79fe"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.10.0/hcp_0.10.0_linux_arm.zip"
    sha256 "c48fc1b10c56158c412e2267edd15f673df8e77b87a7d02814f14b8b6b88b9e1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.10.0/hcp_0.10.0_linux_arm64.zip"
    sha256 "3c9becec5ce1feb9481600bc2b39c71fbed025c3183382478edcaf8dc11425c9"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
