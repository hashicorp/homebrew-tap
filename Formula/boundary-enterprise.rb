# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.17.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.1+ent/boundary_0.17.1+ent_darwin_amd64.zip"
    sha256 "a6c3542d27e03ba395c081bf59beb4358426cedfe965a465d2f99f6e91f7b689"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.1+ent/boundary_0.17.1+ent_darwin_arm64.zip"
    sha256 "534506dca8997ab96a707f2525b47093217eea69d7e8a24e6b20001ba53d040d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.1+ent/boundary_0.17.1+ent_linux_amd64.zip"
    sha256 "72fc69af0335b6d2c124a0bfe58e6427fa79b694ebe1d3da8a4612d82388c12e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.1+ent/boundary_0.17.1+ent_linux_arm.zip"
    sha256 "79cab64a403abaab8198a0205a778c8f0262619bb78ab835ed641aaabeca727f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.1+ent/boundary_0.17.1+ent_linux_arm64.zip"
    sha256 "e77dac676e6e621521b61cc2857e6a438e03e04aae6e16403e0164abc20689f9"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
