# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.0.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.2+ent/boundary_1.0.2+ent_darwin_amd64.zip"
    sha256 "d7b154722d08be2c137fece7745407a413d7e9419a72fd6fcd41578ca30269e9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.0.2+ent/boundary_1.0.2+ent_darwin_arm64.zip"
    sha256 "faca9be2c8817abf39508cee9fec09b77c36588e1f63585bc00e1a523a43077c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.2+ent/boundary_1.0.2+ent_linux_amd64.zip"
    sha256 "d32956ff858cdc60a4309cfc094392547fa67e6dc9267d8e196ab6d88027ecbd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.2+ent/boundary_1.0.2+ent_linux_arm.zip"
    sha256 "6c6fd2de703e9a735df7ab5fa8320f4364e88962e9b196a27c4850f2372c407b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.2+ent/boundary_1.0.2+ent_linux_arm64.zip"
    sha256 "975250804d1f08fb1e1020090030e866fb75c41bb7ba3b78a4a0ebe96a0b0e08"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
