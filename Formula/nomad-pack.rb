# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.4.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.1/nomad-pack_0.4.1_darwin_amd64.zip"
    sha256 "65441b0ce50bdbd2b69a8fcb0faeeba3719ec06249216611406701e20ee9da63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.4.1/nomad-pack_0.4.1_darwin_arm64.zip"
    sha256 "7e6bafb44d6fe8d63ec5d81e55e23d554940bf02835a57761b6a6f2f220ac0b7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.1/nomad-pack_0.4.1_linux_amd64.zip"
    sha256 "08e213dfe76152b512da9fd8c57c24365812a43c96deda6f88cde26aab03310b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.4.1/nomad-pack_0.4.1_linux_arm64.zip"
    sha256 "5561d6a2678439608ef7a798d8d811a12614f49968a756beb790906120f72896"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
