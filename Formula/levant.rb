# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Levant < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Levant"
  homepage "https://github.com/hashicorp/levant"
  version "0.3.3"

  if OS.mac?
    url release_repository << "/levant/0.3.3/levant_0.3.3_darwin_amd64.zip"
    sha256 "da1f7b45a5a10f8d2387ac40aac7eb52c3dbe6606e9948b51ee0efb82f88c165"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/levant/0.3.3/levant_0.3.3_linux_amd64.zip"
    sha256 "630c4c0499fdc0b904be22905e18dcd81350f8011ab1494b23f20d06f192d462"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/levant/0.3.3/levant_0.3.3_linux_arm.zip"
    sha256 "02c7106dbf788fdc592f30393a44c9fc4103c7ec7b5662eed351425b149e3a7e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/levant/0.3.3/levant_0.3.3_linux_arm64.zip"
    sha256 "e2e3bf5aed271d848d8aac86b4649594b7f9aa1e11aa4612f5b571f97598bba4"
  end

  conflicts_with "levant"

  def install
    bin.install "levant"
  end

  test do
    system "#{bin}/levant --version"
  end
end
