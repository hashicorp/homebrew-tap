# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.13.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_darwin_amd64.zip"
    sha256 "ea0742156896530944297bd6bd0aa72ed9bdd89b09090a92c03b16c6fe085b5a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_darwin_arm64.zip"
    sha256 "c7aa3e78239d54b805857b62de771d31d6ce594cda283234eb83e8d61ec45186"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_linux_amd64.zip"
    sha256 "6fe573776dc585664d82e8370b97babd7f15bee9ddd9b9e243901089f70a43d6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_linux_arm.zip"
    sha256 "de487dd313def8320ba525e185c42bae946362feb2ea3b744d3c37c41f93d0e1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.0+ent/boundary_0.13.0+ent_linux_arm64.zip"
    sha256 "97a7e5df6074ca93381ec70dca41d0f2e56d7256824259fb217abd0c572f2b74"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
