# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class OldVersion < Formula
  desc "Old Version Product"
  homepage "https://old.example.com/"
  version "0.9.1"

  def install
    bin.install "old-version"
  end
end