# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc "Policy as code framework"
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.41.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.41.0/sentinel_0.41.0_darwin_amd64.zip"
    sha256 "a011fa4c759fa6b1d677a39fe3c92d9a50c61a30e0828c5d36cae26b4000aabc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.41.0/sentinel_0.41.0_darwin_arm64.zip"
    sha256 "1ce9485f96ad51520cf19a74ce4ed4a4edc3ffc988fd537a26a4bd937662bf65"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.41.0/sentinel_0.41.0_linux_amd64.zip"
    sha256 "357ca824c9ac3ab11520a5ad2c2547b34aeb01dd4e3b9f1c7dc325d0be8a9935"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.41.0/sentinel_0.41.0_linux_arm.zip"
    sha256 "0d51c258bbc87da69cfea5031824dc7c2053e01b87875508dff087229f5ab034"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.41.0/sentinel_0.41.0_linux_arm64.zip"
    sha256 "e4735fcfcc3f2ef161ff2b17207da2f9235ca38ba92609be43e45199f807f1b4"
  end

  def install
    bin.install "sentinel"
  end

  test do
    system bin/"sentinel", "--version"
  end
end
