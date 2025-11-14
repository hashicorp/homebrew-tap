# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TestProduct < Formula
  desc "Test Product"
  homepage "https://test.example.com/"
  version "1.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.example.com/test-product/1.2.3/test-product_1.2.3_darwin_amd64.zip"
    sha256 "abc123"
  end

  def install
    bin.install "test-product"
  end

  test do
    system "#{bin}/test-product --version"
  end
end