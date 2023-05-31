# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.1/hcdiag_0.5.1_darwin_amd64.zip"
    sha256 "be5432b1d8c933bafb2f63df7456501e383052613dea81bb3adee2d636790b48"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.1/hcdiag_0.5.1_darwin_arm64.zip"
    sha256 "0ec738d2dcbd370c54a7fb2986f1a24998ab6e181e4724255ea8f9a13b356df4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.1/hcdiag_0.5.1_linux_amd64.zip"
    sha256 "c1be38a9d3c3d4cd46997a63989740c49061918455f40bc5f6bda84683133c90"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.1/hcdiag_0.5.1_linux_arm.zip"
    sha256 "9f5b1fab24d365485ad6300c20a75db61d9827ac8dcce4e5d1fe28b294779c60"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.1/hcdiag_0.5.1_linux_arm64.zip"
    sha256 "2c7bddf5f9f70a8f8c9d590a5d1359d5f423af59b3ceeb374d292c3c5417c9ba"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
