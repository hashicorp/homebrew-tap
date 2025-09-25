# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.20.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.0+ent/boundary_0.20.0+ent_darwin_amd64.zip"
    sha256 "aea03b45457e27f2299e8ff6cb0e58b2ed3af7e6edaf3388980f46b13a953422"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.20.0+ent/boundary_0.20.0+ent_darwin_arm64.zip"
    sha256 "be47b7c024608c957395faf08515881c09bf88e6cf633abae2e84f01d70dec88"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.0+ent/boundary_0.20.0+ent_linux_amd64.zip"
    sha256 "53bdbd26bde7da26830bc0db86e8b6fb02a6a8f65873bf32346601fffc703599"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.0+ent/boundary_0.20.0+ent_linux_arm.zip"
    sha256 "e4c8b966e705d6f7d2c43f25924d879470386f4516f2630f6259105a70d2548a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.0+ent/boundary_0.20.0+ent_linux_arm64.zip"
    sha256 "57c9effa93b23b9073ac3c4c0081fc8e7462580c012fce87ec64b121e784ba56"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
