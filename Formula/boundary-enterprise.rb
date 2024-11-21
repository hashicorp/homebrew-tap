# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.18.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.1+ent/boundary_0.18.1+ent_darwin_amd64.zip"
    sha256 "4648a7aebbb17a48513c2fb5a73afd58f50af12b3706f9fefe9f5e04307265b6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.1+ent/boundary_0.18.1+ent_darwin_arm64.zip"
    sha256 "8b4e38a328b56c80b8d66f8029f9faea6a6b4c8e97e27952f33cca7b1050cfec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.1+ent/boundary_0.18.1+ent_linux_amd64.zip"
    sha256 "e70d1b59a979e657ea95606ec16a976bff90b5cf975f5e5ee2e0a9e475f70ac4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.1+ent/boundary_0.18.1+ent_linux_arm.zip"
    sha256 "0608cbd9a18d91338db69ce605f7b8073ba828cd0b96b7274c74aa495e280194"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.1+ent/boundary_0.18.1+ent_linux_arm64.zip"
    sha256 "2f4f5afc72854785c928b47ae41a8fc5152721726789d90e675d7dbad738217f"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
