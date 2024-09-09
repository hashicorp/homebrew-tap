# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.0/tfstacks_0.5.0_darwin_amd64.zip"
    sha256 "1da5205327fe0d821994c5152594c97aff6f0afd5e2c5d5640fba9fd418e6f49"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.5.0/tfstacks_0.5.0_darwin_arm64.zip"
    sha256 "58680a0ffc036e43ada8f6893b76f0d3f3530751cb06462a48da09d0b7648853"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.0/tfstacks_0.5.0_linux_amd64.zip"
    sha256 "8b72c6ece7fd83ed578c65e3a46f2fade61e239862680cb4c1ddc5a04ab8ad7e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.0/tfstacks_0.5.0_linux_arm.zip"
    sha256 "07c075530677c473ad737f5b273b039581f747ba1b382cb2fd5f82d0e130ffa4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.0/tfstacks_0.5.0_linux_arm64.zip"
    sha256 "62e75bd52723a6b1d496bc113967587f8770561a0345a074ca9658741d830c3e"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
