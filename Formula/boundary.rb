# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.1/boundary_0.13.1_darwin_amd64.zip"
    sha256 "5ea74dbfce8dc51b718961486bb2a0a5ddcb7d2a88907becfd2404cd65bdb75e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.13.1/boundary_0.13.1_darwin_arm64.zip"
    sha256 "a148b40164b3ff7508fae9bc8c2bd3437df4cd6c5be9a819312be891ee9a7ab7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.1/boundary_0.13.1_linux_amd64.zip"
    sha256 "7e549922c0cb31e46fbbbb52eaa6cfccbf40046b8a50844adf644c9ef335cb97"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.1/boundary_0.13.1_linux_arm.zip"
    sha256 "d877d784cc69994d14b3f786e330dcff6c355549126966cba6c49366f03a9c77"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.1/boundary_0.13.1_linux_arm64.zip"
    sha256 "5d7cb7041ec6d561b256c9439e83c573da7a5f8a5146fa661c77a77457386c7c"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
