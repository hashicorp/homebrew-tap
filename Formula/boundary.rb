# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.16.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.2/boundary_0.16.2_darwin_amd64.zip"
    sha256 "29478c2b34ac186c1e3a490afe4c465ec0e945a63659ef4d1d9906966fb5add7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.16.2/boundary_0.16.2_darwin_arm64.zip"
    sha256 "727352fb0dd16ee7e7f3f61bf51ad1c14a8359d3ef5c4bccac929511796e3284"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.2/boundary_0.16.2_linux_amd64.zip"
    sha256 "42618e2f1f0e413ad8a9abc5d731dd425b135446e8f007e38057132b51b066d3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.2/boundary_0.16.2_linux_arm.zip"
    sha256 "e146204bef6c0d37d5c866f1d0fbe1e6ac10b19c174454dd09d1577e3133d944"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.2/boundary_0.16.2_linux_arm64.zip"
    sha256 "541a530f3da2e79aa054d0812790c2c60a75225ff5e89c316b4e3a26a0833685"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
