# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/packer/1.10.0/packer_1.10.0_darwin_amd64.zip"
    sha256 "8a2a1ff87b7057b3a62dabc90e6875e6e4a7427098cc266793ae8a8e292e2833"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/packer/1.10.0/packer_1.10.0_darwin_arm64.zip"
    sha256 "d0cfb884a54d928a5d73150b9a492a5be855105b52b4c50a81059b0beeced408"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/packer/1.10.0/packer_1.10.0_linux_amd64.zip"
    sha256 "a8442e7041db0a7db48f468e353ee07fa6a7b35276ec62f60813c518ca3296c1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/packer/1.10.0/packer_1.10.0_linux_arm.zip"
    sha256 "3b2b97344d13bf25877edfc3ae92e273d2046d811a8174105756edf75e3dba2b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/packer/1.10.0/packer_1.10.0_linux_arm64.zip"
    sha256 "37149ec9ca322aa50f249a645e43e67498b67e785b356c59f9b0f0e6519da78e"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
