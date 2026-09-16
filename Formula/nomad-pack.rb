# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.2/nomad-pack_0.4.2_darwin_amd64.zip"
    sha256 "c8a77d76b22c11474b546e1496ca50e544ea3dd2a3b5568e56694c91388040f8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.4.2/nomad-pack_0.4.2_darwin_arm64.zip"
    sha256 "f79be784281fecc64fa0af4a93bda487b0d1ee152d0dad635b93ce98e77522d7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.4.2/nomad-pack_0.4.2_linux_amd64.zip"
    sha256 "58399149a2b3944d17294fb5c98b30cd02fc9fd1f8d5275713be3dbc5345bfb4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.4.2/nomad-pack_0.4.2_linux_arm64.zip"
    sha256 "d0e537be563f5c18d7183d20c44388d4bb74c22f5dd3583882e4577e0f77c160"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
