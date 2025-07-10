# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.19.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.3+ent/boundary_0.19.3+ent_darwin_amd64.zip"
    sha256 "f793aafba15e811cba191789aa7d005a8d4aa4ba3069cf186dcaf2d7705ff0af"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.3+ent/boundary_0.19.3+ent_darwin_arm64.zip"
    sha256 "f38ec49edeae789b8d02321b2e4c672caeebef718b6fc07d9209a54d43381202"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.3+ent/boundary_0.19.3+ent_linux_amd64.zip"
    sha256 "9f306d1d6eed90d0c71202eeb583697eef1cbacfcdddc92711820ed0cbbf2b6c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.3+ent/boundary_0.19.3+ent_linux_arm.zip"
    sha256 "00281ac1904ae6cc53cd5e17ae04f12a26e27d062c14a1136f79c30136f7420a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.3+ent/boundary_0.19.3+ent_linux_arm64.zip"
    sha256 "6aa7015f9ec7b4d503e259dd0a1de3cddd7f7341e80c3b63f9f480a7984b26fc"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
