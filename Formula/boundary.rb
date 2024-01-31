# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.0/boundary_0.15.0_darwin_amd64.zip"
    sha256 "c9a974b2c0773c914856cb6548cbfa9408524bfd8f5feb9c618cf4d531975fe5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.0/boundary_0.15.0_darwin_arm64.zip"
    sha256 "03a339a045b34d5ed6c7f76b04ebece21ec76e5bf94ffec3d1b5317165c341ee"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.0/boundary_0.15.0_linux_amd64.zip"
    sha256 "85346b2af81611faba80a5d8f821492124b3516d0c674bfef64ba8a885c98ac2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.0/boundary_0.15.0_linux_arm.zip"
    sha256 "0e53adc2625fc404f46dd4d32e18593f567f5a525a327a98db151a3e9ecfe59a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.0/boundary_0.15.0_linux_arm64.zip"
    sha256 "1a24b1b9eaf903a9be7bcb8f6e9be9a84771319c3eb989800c99759ecfcd2461"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
