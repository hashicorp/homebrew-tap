# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.21.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.21.1/sentinel_0.21.1_darwin_amd64.zip"
    sha256 "63b0d9d23d6ab320dd15e2842f165c5990e318eb19781ad2c46dc0c5fabf011b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.21.1/sentinel_0.21.1_darwin_arm64.zip"
    sha256 "fcbaa4298fc69d28b561993eee70c28b56e9da7821f0d64ff94ce5819cb5b554"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.21.1/sentinel_0.21.1_linux_amd64.zip"
    sha256 "741543b990436d120e05713555611020cc27310b02ae61be9178df4f5c8005dc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.21.1/sentinel_0.21.1_linux_arm.zip"
    sha256 "b92e5dc4397f5e6f12d48388bfd540d6930da11f181328b073e00f936f234e4c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.21.1/sentinel_0.21.1_linux_arm64.zip"
    sha256 "d0552145266c8059e18ea0ee8db552346eb8820eeb20c2e1bf4dcdb4711cce08"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
