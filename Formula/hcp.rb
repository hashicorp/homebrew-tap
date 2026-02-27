# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.11.0/hcp_0.11.0_darwin_amd64.zip"
    sha256 "5dc1d68c848eebf33a8897885f51ba243b82abe2f5db6546b404729b7bfbe6a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.11.0/hcp_0.11.0_darwin_arm64.zip"
    sha256 "064fb59443d437d71a532ae054ba888fe993ce34164cb858c54ea416226a2417"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.11.0/hcp_0.11.0_linux_amd64.zip"
    sha256 "09a0d2bd8a8834907e162188c4d68468824444aca163b28b8c38ba63749fb052"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.11.0/hcp_0.11.0_linux_arm.zip"
    sha256 "15f8eae1b4abc91f4a03380b583503304cd16e5cad468845c34c1eb67766daa3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.11.0/hcp_0.11.0_linux_arm64.zip"
    sha256 "2a2528756df22dbab5cfb0645ae3098c811a5f033c9a98e6171c6aa8f728bf5e"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
