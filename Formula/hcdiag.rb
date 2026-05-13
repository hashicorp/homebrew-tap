# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.12"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.12/hcdiag_0.5.12_darwin_amd64.zip"
    sha256 "19dfedaaef1afa226fd3c98dc72882312ab1c2957755a1bdbd3c559142b264e3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.12/hcdiag_0.5.12_darwin_arm64.zip"
    sha256 "bc3c49df3e4f9b9dbdaae0163d97c92b5c812850043f941e513adca2d52f3bc8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.12/hcdiag_0.5.12_linux_amd64.zip"
    sha256 "9b8eb65de6f12081f971990708be7100b5e96658346ab15db981c285bdff8240"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.12/hcdiag_0.5.12_linux_arm.zip"
    sha256 "0f45d203d6c08c32b739398bda6f134cd1a501472b71ef5cca822ef292192231"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.12/hcdiag_0.5.12_linux_arm64.zip"
    sha256 "733710538a30299136f973830e47ced0583a4f3620835f733b58ce70df5c4b54"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
