# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.25.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_darwin_amd64.zip"
    sha256 "e43b3ce562e060565ee92dc8445a932728022a261aebe16d3af2399845048409"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_darwin_arm64.zip"
    sha256 "a8d787cd53a32aeb59e70f7a165f239304f1a18b7426fdf34a9fa9cc5f2ed362"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_linux_amd64.zip"
    sha256 "19e6774e6450be6de764042682d304882d65a40ba07bc4f004840fc88954cdf0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_linux_arm.zip"
    sha256 "dec0f04529b64bb806d0dbc9f80ce38265ead118dfda5e6a948c97525560a7ea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_linux_arm64.zip"
    sha256 "4de7e0eecf37f3c25911fa1761837afd8c8ab5fe7ffa4e7a20c9d1faa1bce90e"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
