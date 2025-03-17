# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.6/hcdiag_0.5.6_darwin_amd64.zip"
    sha256 "8c8fc38904c9936b17737ac801c91391a3fba49519005753083cd15ffa5a7602"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.6/hcdiag_0.5.6_darwin_arm64.zip"
    sha256 "679a5327b912c1d4609000f522f90ab885d0b93c0a514b06b35a8167159b1041"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.6/hcdiag_0.5.6_linux_amd64.zip"
    sha256 "90fb965883d5c1203a3f394c2eb906bad48507f9d530c4b036728370b472b5a0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.6/hcdiag_0.5.6_linux_arm.zip"
    sha256 "a8deece1311561076d3c39fb9d11884fa9b900f603e330dc61a095f32007e1f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.6/hcdiag_0.5.6_linux_arm64.zip"
    sha256 "1ed7a992161e4d0e60d504eaf9809e6a0ca8af1037eb646c357d7d5af9bcaf8f"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
