# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.40.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.40.0/sentinel_0.40.0_darwin_amd64.zip"
    sha256 "6961d4db9ac5635a395f68bc0a5debb7bbfa34222eec896bc384fc3af16be3ac"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.40.0/sentinel_0.40.0_darwin_arm64.zip"
    sha256 "75dd8347e8fc609ff01079386e05676e11023ef82f947c8f8c033fe21bc6c3b2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.40.0/sentinel_0.40.0_linux_amd64.zip"
    sha256 "a358aa14abfe93e7d48095e740454f026c81e8c81503010a1a58d21788179425"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.40.0/sentinel_0.40.0_linux_arm.zip"
    sha256 "cc65ade34407928d900abc33aae8d5c72d962027f4e334e0c50f91511544cd87"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.40.0/sentinel_0.40.0_linux_arm64.zip"
    sha256 "d53523548c5cec641ce994d3178fd3fcc131424b3349738448044f1f38c7e4c4"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
