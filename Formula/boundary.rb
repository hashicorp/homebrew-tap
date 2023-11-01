# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.14.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.1/boundary_0.14.1_darwin_amd64.zip"
    sha256 "2ab4701fa927d7d59b1f2e4412bb962e4fda00367b9bae9f4732c2593e5f5ff8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.1/boundary_0.14.1_darwin_arm64.zip"
    sha256 "e5f9902a0ea72cc02e8e81fa6f37aebebcb01be3fa60ceadecb71008dd405a26"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.1/boundary_0.14.1_linux_amd64.zip"
    sha256 "7e422f4b32bfa24ec57ee9979bd6585b7cc2206c6c54b112c7946586d31e327a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.1/boundary_0.14.1_linux_arm.zip"
    sha256 "d8613e96abdb79ddeb3b9bae7017a6aa3c0a694a572c0fedb5b8430b025051d5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.1/boundary_0.14.1_linux_arm64.zip"
    sha256 "cfd5a6be55947b7618875bebc055685477300f272a0b45a0463080300b89b57b"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
