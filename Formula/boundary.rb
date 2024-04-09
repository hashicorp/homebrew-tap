# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.15.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.4/boundary_0.15.4_darwin_amd64.zip"
    sha256 "c723cac1e1ecad54ee2bd5b282e166262cb79b7622d2139808d1e39f544d1271"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.4/boundary_0.15.4_darwin_arm64.zip"
    sha256 "83955dc7215d9f9b1f0946d1e74d603f13b5e80773e5bc4ddb320040cc6bf084"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.4/boundary_0.15.4_linux_amd64.zip"
    sha256 "e0ed23745e48d9371c537ba707e8ce8d23e82d04145f67377ee0916200fd7788"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.4/boundary_0.15.4_linux_arm.zip"
    sha256 "373bfd7fe84b8fbe8050d426858caadd939c60f230fe490038558f499c807e77"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.4/boundary_0.15.4_linux_arm64.zip"
    sha256 "9dded0df4d8fd8331c0c1cea759646da3ab502b7d498f1af3f9d6006bf06d2de"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
