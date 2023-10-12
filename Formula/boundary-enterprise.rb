# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.14.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.0+ent/boundary_0.14.0+ent_darwin_amd64.zip"
    sha256 "89e903d2da54c31dcc1cbeaa6cff6cb1cd0e62a23142ca0e8ce3ade053b71607"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.0+ent/boundary_0.14.0+ent_darwin_arm64.zip"
    sha256 "dbfe5fe3414dfe7bcd5b0e6bd8fca3a9483f633c103e7ab652ecea1e4781eb8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.0+ent/boundary_0.14.0+ent_linux_amd64.zip"
    sha256 "7f7c94bc53e490d7976b53b0e275a40b55cd4cbd493b0f770f9faf23c5517aae"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.0+ent/boundary_0.14.0+ent_linux_arm.zip"
    sha256 "705bed6118ee15dcccdf0e0dcbead17513adfac043e75416991a9414977c9d31"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.0+ent/boundary_0.14.0+ent_linux_arm64.zip"
    sha256 "1d24c5dd046fd316dc0f238109a50f4024550193140ecd807e73a39a55f8153c"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
