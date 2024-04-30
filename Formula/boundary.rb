# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.16.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.0/boundary_0.16.0_darwin_amd64.zip"
    sha256 "d596a9b119cf82b4adce3a1fd29d58f4c0b090d9f71781792c7806d7f1ba2386"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.16.0/boundary_0.16.0_darwin_arm64.zip"
    sha256 "8e3601f5c055f6ffee3b1a351d87a38b83d5818c7a9e62b773b337c0d804737b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.0/boundary_0.16.0_linux_amd64.zip"
    sha256 "3a84f363b31c86c8625ce10437b7b241df07a37df9ca54680e335f689e7215b1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.0/boundary_0.16.0_linux_arm.zip"
    sha256 "add8a3fba5a85fe30c4129e0bd82b49693ad19d107621c5eb053a8688f716692"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.0/boundary_0.16.0_linux_arm64.zip"
    sha256 "cd6d23eb3c5c9b5be14546338923d8340ebaf8f6684e5574bbd26734569b23b6"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
